#include "cpu.h"

#include <stdio.h>
#include <stdlib.h>

#include "data.h"

/************************************************
 *  PUBLIC FUNCTIONS
 ***********************************************/

void createCpu(mos6502* _cpu) {
	_cpu->A = 0;
	_cpu->PC = 0x8000;
	_cpu->SP = 0;
	_cpu->flags = 0x24;
	_cpu->X = 0;
	_cpu->Y = 0;
	_cpu->interrupts = 0;
	_cpu->devices = nullptr;
	_cpu->deviceCount = 0;
	fputs("CREATED CPU\n", stdout);
}

// create functions that give read/write access to memory
makeDeviceAdder(mos6502);
makeDeviceReader(mos6502);
makeDeviceWriter(mos6502);

static inline void push(mos6502* _cpu, uint8_t val) {
	write_mos6502(_cpu, 0x100 + (_cpu->SP--), val);
}

static inline uint8_t pop(mos6502* _cpu) {
	return read_mos6502(_cpu, 0x100 + (++_cpu->SP));
}

/************************************************
 * DEBUG PRINT HELPERS
 ***********************************************/

void printPage(mos6502* _cpu, uint8_t page) {
    uint8_t pageData[256];
	for (int i = 0; i < 16; ++i) {
        for (int j = 0; j < 16; ++j) {
            pageData[i * 16 + j] = read_mos6502(_cpu, (page << 8) + (i * 16 + j));
        }
    }
    printf("PAGE %02x\n", page);
    for (int i = 0; i < 16; ++i) {
        for (int j = 0; j < 16; ++j) {
            printf("%02X ", pageData[i * 16 + j]);
		}
		printf("\n");
	}
}

void printRegisters(mos6502* _cpu) {
	fprintf(stdout, "CPU REGISTERS:\n-- A    =0x%02X\n-- X    =0x%02X\n-- Y    =0x%02x\n-- SP   =0x%02X\n-- PC   =0x%04X\n-- FLAGS=0x%02X\n"
		, _cpu->A, _cpu->X, _cpu->Y, _cpu->SP + 0x0100, _cpu->PC, _cpu->flags);
}

/************************************************
 *  FLAG FUNCTIONS
 ***********************************************/

#define FLAG_N 0b10000000 // negative
#define FLAG_V 0b01000000 // overflow
#define FLAG_X 0b00100000 // -
#define FLAG_B 0b00010000 // breakpoint
#define FLAG_D 0b00001000 // decimal
#define FLAG_I 0b00000100 // interrupt
#define FLAG_Z 0b00000010 // zero
#define FLAG_C 0b00000001 // carry

static inline void setFlags(mos6502* _cpu, uint8_t flags) {
	_cpu->flags |= flags;
}

static inline void setFlag(mos6502* _cpu, uint8_t flag, bool state) {
	if (state) _cpu->flags |= flag;
	else _cpu->flags &= ~flag;
}

static inline void unsetFlag(mos6502* _cpu, uint8_t flag) {
	_cpu->flags &= ~flag;
}

static inline bool testFlag(mos6502* _cpu, uint8_t flag) {
	return _cpu->flags & flag;
}

// modify the N and Z flags 
static inline void doNZ(mos6502* _cpu, uint8_t val) {
	setFlag(_cpu, FLAG_N, val & FLAG_N);
	setFlag(_cpu, FLAG_Z, !val);
}

// modify N, Z and C flags 
static inline void doNZC(mos6502* _cpu, uint16_t val) {
	setFlag(_cpu, FLAG_N, val & FLAG_N);
	setFlag(_cpu, FLAG_Z, !(val & 0x00FF));
	setFlag(_cpu, FLAG_C, val & 0x0100);
}

/************************************************
 *  INTERRUPT FUNCTIONS
 ***********************************************/

#define IRQ_VEC 0xFFFE
#define NMI_VEC 0xFFFA
#define BRK_VEC 0xFFFE
#define RST_VEC 0xFFFC

// non-maskable interrupt
void triggerNMI(mos6502* _cpu) {
    printf("nmi\n");
	_cpu->PC += 2;
	push(_cpu, _cpu->PC >> 8); // push high byte on to stack first
	push(_cpu, _cpu->PC & 0x00FF); // then push the low byte
	setFlags(_cpu, FLAG_X); 
	setFlag(_cpu, FLAG_B, false);
	push(_cpu, _cpu->flags); // push status register on to stack
	setFlags(_cpu, FLAG_I);
	_cpu->PC = read_mos6502(_cpu, NMI_VEC); // put address of interrupt into PC (low byte first)
	_cpu->PC |= read_mos6502(_cpu, NMI_VEC + 1) << 8;
	printPage(_cpu, 1);
}

// reset
void triggerRST(mos6502* _cpu) {
	_cpu->PC += 2;
	push(_cpu, _cpu->PC >> 8);
	push(_cpu, _cpu->PC & 0x00FF);
	push(_cpu, _cpu->flags);
	setFlags(_cpu, FLAG_I);
	_cpu->PC = read_mos6502(_cpu, RST_VEC);
	_cpu->PC |= read_mos6502(_cpu, RST_VEC + 1) << 8;

}

// interrupt request
void triggerIRQ(mos6502* _cpu) { 
	_cpu->PC += 2;
	push(_cpu, _cpu->PC >> 8);
	push(_cpu, _cpu->PC & 0xFF);
	setFlags(_cpu, 32);
	setFlag(_cpu, FLAG_B, false);
	push(_cpu, _cpu->flags);
	setFlags(_cpu, FLAG_I);
	_cpu->PC = read_mos6502(_cpu, IRQ_VEC);
	_cpu->PC |= read_mos6502(_cpu, IRQ_VEC + 1) << 8;
}

/************************************************
 *  ADDRESS MODES
 ***********************************************/

 // absolute addressing
static inline uint16_t abss(mos6502* _cpu) {
	uint16_t address = read_mos6502(_cpu, _cpu->PC) | (read_mos6502(_cpu, _cpu->PC + 1) << 8);
	_cpu->PC += 2;
	return address;
}

static inline uint8_t accRead(mos6502* _cpu) {
	return _cpu->A;
}

static inline void accWrite(mos6502* _cpu, uint8_t val) {
	_cpu->A = val;
}

// absolute + value of X
static inline uint16_t absx(mos6502* _cpu) {
	uint16_t ret = (read_mos6502(_cpu, _cpu->PC) | (read_mos6502(_cpu, _cpu->PC + 1) << 8)) + _cpu->X;
	_cpu->PC += 2;
	return ret;
}

// absolute + value of Y
static inline uint16_t absy(mos6502* _cpu) {
	uint16_t ret = (read_mos6502(_cpu, _cpu->PC) | (read_mos6502(_cpu, _cpu->PC + 1) << 8)) + _cpu->Y;
	_cpu->PC += 2;
	return ret;
}

static inline uint16_t imm(mos6502* _cpu) {
	return _cpu->PC++;
}

uint16_t ind(mos6502* _cpu) {
	uint16_t address = (read_mos6502(_cpu, _cpu->PC) | (read_mos6502(_cpu, _cpu->PC + 1) << 8));
	uint16_t val = read_mos6502(_cpu, address) | (read_mos6502(_cpu, (address & 0xFF00) | ((address + 1) & 0x00FF)) << 8);
	_cpu->PC += 2;
	return val;
}

// read(address + value of X)
uint16_t xind(mos6502* _cpu) {
	uint8_t address = (read_mos6502(_cpu, _cpu->PC)) + _cpu->X;
	uint16_t val = read_mos6502(_cpu, address) | (read_mos6502(_cpu, (uint8_t)(address + 1)) << 8);
	_cpu->PC += 1;
	return val;
}

// read(address) + value of Y
uint16_t indy(mos6502* _cpu) {
	uint8_t address = (read_mos6502(_cpu, _cpu->PC));
	uint16_t val = (read_mos6502(_cpu, address) | (read_mos6502(_cpu, (uint8_t)(address + 1)) << 8)) + _cpu->Y;
	_cpu->PC += 1;
	return val;
}

// zeropage
static inline uint16_t zpg(mos6502* _cpu) {
	uint8_t val = read_mos6502(_cpu, _cpu->PC);
	_cpu->PC += 1;
	return (uint8_t)val;
}

// zeropage + value of X
static inline uint16_t zpgx(mos6502* _cpu) {
	uint8_t val = (uint8_t)(read_mos6502(_cpu, _cpu->PC) + _cpu->X);
	_cpu->PC += 1;
	return val;
}

// zeropage + value of Y
static inline uint16_t zpgy(mos6502* _cpu) {
	uint8_t val = (uint8_t)(read_mos6502(_cpu, _cpu->PC) + _cpu->Y);
	_cpu->PC += 1;
	return val;
}

static inline uint16_t rel(mos6502* _cpu) {
	return (int8_t)read_mos6502(_cpu, _cpu->PC++) + _cpu->PC;
}

/************************************************
 *  INSTRUCTIONS
 ***********************************************/

// TODO: ---------------------------IMPLEMENT THIS WHEN I KNOW WHAT IT DOES---------------------------
int BRK(mos6502* _cpu) { // force break
	_cpu->PC += 2;
	push(_cpu, _cpu->PC >> 8); // push PC + 2
	push(_cpu, _cpu->PC & 0xff);
	setFlags(_cpu, FLAG_B | 0x20);
	push(_cpu, _cpu->flags); // push status register
	setFlags(_cpu, FLAG_I);
	_cpu->PC = read_mos6502(_cpu, IRQ_VEC);
	_cpu->PC |= read_mos6502(_cpu, IRQ_VEC + 1) << 8;
	return 7;
}

#define makeCL(flag) int CL##flag(mos6502 *_cpu) {\
    unsetFlag(_cpu, FLAG_##flag);\
    return 2;\
}
makeCL(C) // CLC - clear carry flag
makeCL(I) // CLI - clear interrupt disable bit
makeCL(V) // CLV - clear overflow flag
makeCL(D) // CLD - clear decimal mode

#define makeSE(flag) int SE##flag(mos6502 *_cpu) {\
    setFlags(_cpu, FLAG_##flag);\
    return 2;\
}
makeSE(C) // SEC - set carry flag
makeSE(I) // SEI - set interrupt disable status
makeSE(D) // SED - set decimal flag

// ORA - OR memory with accumulator
#define makeORA(addMode, clockcycles) int ORA_##addMode (mos6502 *_cpu) {\
    uint8_t val = _cpu->A | read_mos6502(_cpu, addMode(_cpu));\
    _cpu->A = val;\
    doNZ(_cpu, val);\
    return clockcycles;\
}
makeORA(imm, 2)
makeORA(zpg, 3)
makeORA(zpgx, 4)
makeORA(abss, 4)
makeORA(absx, 4)
makeORA(absy, 4)
makeORA(xind, 6)
makeORA(indy, 5)

// ASL - arithmetic shift memory left by one bit
#define makeASL(addMode, clockcycles) int ASL_##addMode (mos6502 *_cpu) {\
    uint16_t address = addMode(_cpu);\
    uint16_t val = read_mos6502(_cpu, address) << 1;\
    write_mos6502(_cpu, address, (uint8_t) val);\
    doNZC(_cpu, val);\
    return clockcycles;\
}
makeASL(zpg, 5)
makeASL(zpgx, 6)
makeASL(abss, 6)
makeASL(absx, 7)

int ASLA(mos6502* _cpu) { // for accumulator
	uint16_t val = _cpu->A << 1;
	_cpu->A = (uint8_t)val;
	doNZC(_cpu, val);
	return 2;
}

// SLO - shift memory left by one bit, then OR memory with accumulator **UNOFFICIAL
#define makeSLO(addMode, clockcycles) int SLO_##addMode (mos6502 *_cpu) {\
	/* do ASL instruction */\
	{\
    uint16_t address = addMode(_cpu);\
    uint16_t val = read_mos6502(_cpu, address) << 1;\
    write_mos6502(_cpu, address, (uint8_t) val);\
    doNZC(_cpu, val);\
	}\
	/* do ORA instruction */\
    uint8_t val = _cpu->A | read_mos6502(_cpu, addMode(_cpu));\
    _cpu->A = val;\
    doNZ(_cpu, val);\
	return clockcycles;\
}
makeSLO(zpg, 5)
makeSLO(zpgx, 6)
makeSLO(abss, 6)
makeSLO(absx, 7)
makeSLO(absy, 7)
makeSLO(xind, 8)
makeSLO(indy, 8)

// SRE - shift memory right by one bit, then XOR memory with accumulator **UNOFFICIAL
#define makeSRE(addMode, clockcycles) int SRE_##addMode (mos6502 *_cpu) {\
	/* do LSR instruction */\
	uint16_t address = addMode(_cpu);\
	uint8_t rval = read_mos6502(_cpu, address);\
    uint8_t wval = rval >> 1;\
    write_mos6502(_cpu, address, wval);\
	setFlag(_cpu, FLAG_C, rval & 1);\
    doNZC(_cpu, wval);\
	/* do EOR instruction */\
	_cpu->A ^= read_mos6502(_cpu, addMode(_cpu));\
    doNZ(_cpu, _cpu->A);\
	return clockcycles;\
}
makeSRE(zpg, 5)
makeSRE(zpgx, 6)
makeSRE(abss, 6)
makeSRE(absx, 7)
makeSRE(absy, 7)
makeSRE(xind, 8)
makeSRE(indy, 8)

// JSR - jump to new location and save return address
#define makeJSR(addMode, clockcycles) int JSR(mos6502 *_cpu) {\
    uint16_t val = addMode(_cpu);\
    _cpu->PC -= 1;\
    push(_cpu, _cpu->PC >> 8);\
    push(_cpu, _cpu->PC & 0x00FF);\
    _cpu->PC = val;\
    return clockcycles;\
}
makeJSR(abss, 6)

// BIT - test bits in memory with accumulator (bits 7 and 6 of operand are transferred to N,V flags of status register)
//		 zero flag is set to the result of operand AND accumulator
#define makeBIT(addMode, clockcycles) int BIT_##addMode (mos6502 *_cpu) {\
    uint8_t mem = read_mos6502(_cpu, addMode(_cpu));\
    uint8_t res = _cpu->A & mem;\
    setFlag(_cpu, FLAG_Z, !res);\
    _cpu->flags = (_cpu->flags & 0x3F) | (mem & 0xC0); /* take the 2 MSB from memory value and store as the 2 MSB of flags*/\
    return clockcycles;\
}
makeBIT(zpg, 3)
makeBIT(abss, 4)

// AND - AND memory with accumulator  
#define makeAND(addMode, clockcycles) int AND_##addMode (mos6502 *_cpu) {\
    uint8_t val = _cpu->A & read_mos6502(_cpu, addMode(_cpu));\
    _cpu->A = val;\
    doNZ(_cpu, val);\
    return clockcycles;\
}
makeAND(imm, 2);
makeAND(zpg, 3);
makeAND(zpgx, 4);
makeAND(abss, 4);
makeAND(absx, 4);
makeAND(absy, 4);
makeAND(xind, 6);
makeAND(indy, 5);

// ROL - rotate one bit left
#define makeROL(addMode, clockcycles) int ROL_##addMode (mos6502 *_cpu) {\
    uint16_t address = addMode(_cpu);\
    uint8_t val = read_mos6502(_cpu, address);\
    val = (val << 1) | (val >> 7);\
    write_mos6502(_cpu, address, val);\
    doNZ(_cpu, val);\
    setFlag(_cpu, FLAG_C, val & 1);\
    return clockcycles;\
}
makeROL(zpg, 5)
makeROL(zpgx, 6)
makeROL(abss, 6)
makeROL(absx, 7)

int ROLA(mos6502* _cpu) { // for accumulator
	uint8_t val = _cpu->A;
	val = (val << 1) | (val >> 7);
	_cpu->A = val;
	doNZ(_cpu, val);
	setFlag(_cpu, FLAG_C, val & 1);
	return 2;
}

// JMP - jump to new location
#define makeJMP(addMode, clockcycles) int JMP_##addMode (mos6502 *_cpu) {\
    _cpu->PC = addMode(_cpu);\
    return clockcycles;\
}
makeJMP(abss, 3)
makeJMP(ind, 5)

// LSR - logical shift one bit right
#define makeLSR(addMode, clockcycles) int LSR_##addMode (mos6502 *_cpu) {\
    uint16_t address = addMode(_cpu);\
    uint8_t rval = read_mos6502(_cpu, address);\
    uint8_t wval = rval >> 1;\
    write_mos6502(_cpu, address, wval);\
    doNZ(_cpu, wval);\
    setFlag(_cpu, FLAG_C, rval & 1);\
    return clockcycles;\
}
makeLSR(zpg, 3)
makeLSR(zpgx, 4)
makeLSR(abss, 4)
makeLSR(absx, 5)

int LSRA(mos6502* _cpu) { // for accumulator
	uint8_t rval = _cpu->A;
	uint8_t wval = rval >> 1;
	_cpu->A = wval;
	doNZ(_cpu, wval);
	setFlag(_cpu, FLAG_C, rval & 1);
	return 2;
}

// EOR - XOR memory with accumulator 
#define makeEOR(addMode, clockcycles) int EOR_##addMode (mos6502 *_cpu) {\
    _cpu->A ^= read_mos6502(_cpu, addMode(_cpu));\
    doNZ(_cpu, _cpu->A);\
    return clockcycles;\
}
makeEOR(imm, 2)
makeEOR(zpg, 3)
makeEOR(zpgx, 4)
makeEOR(abss, 4)
makeEOR(absx, 4)
makeEOR(absy, 4)
makeEOR(xind, 6)
makeEOR(indy, 5)

// ADC - add memory to accumulator with carry
#define makeADC(addMode, clockcycles) int ADC_##addMode (mos6502 *_cpu) {\
    uint8_t val = read_mos6502(_cpu, addMode(_cpu));\
    uint8_t mayover = ~(val ^ _cpu->A);\
    uint16_t total = val + _cpu->A + (testFlag(_cpu, FLAG_C) ? 1 : 0);\
    _cpu->A = (uint8_t) total;\
    doNZC(_cpu, total);\
    setFlag(_cpu, FLAG_V, mayover & (val ^ _cpu->A) & 0x80);\
    return clockcycles;\
}
makeADC(imm, 2)
makeADC(zpg, 3)
makeADC(zpgx, 4)
makeADC(abss, 4)
makeADC(absx, 4)
makeADC(absy, 4)
makeADC(xind, 6)
makeADC(indy, 5)

// intermediary definition that allows for proper carrying when adding values to registers
#define SUBmac(reg, addMode, clockcycles, carry) uint8_t vv = read_mos6502(_cpu, addMode(_cpu));\
    uint16_t val = _cpu->reg + (uint8_t)(~vv) + carry;\
    /*printf("sub %hhi, %hhi, %hhi\n", _cpu->reg, vv, (int8_t)val);*/\
    doNZC(_cpu, val);

// SBC - subtract memory from accumulator with borrow
#define makeSBC(addMode, clockcycles) int SBC_##addMode(mos6502 *_cpu) {\
    SUBmac(A, addMode, clockcycles, (testFlag(_cpu, FLAG_C) ? 1 : 0));\
    setFlag(_cpu, FLAG_V, (((vv&0x80))? (int8_t)val < (int8_t)_cpu->A : (int8_t)val > (int8_t)_cpu->A));\
    _cpu->A = (uint8_t) val;\
    return clockcycles;\
}
makeSBC(imm, 2)
makeSBC(zpg, 3)
makeSBC(zpgx, 4)
makeSBC(abss, 4)
makeSBC(absx, 4)
makeSBC(absy, 4)
makeSBC(xind, 6)
makeSBC(indy, 5)

//CMP - compare memory with accumulator
#define makeCMP(addMode, clockcycles) int CMP_##addMode (mos6502 *_cpu) {\
    SUBmac(A, addMode, clockcycles, 1);\
    return clockcycles;\
}

#define makeCP_(reg, addMode, clockcycles) int CP##reg##_##addMode (mos6502 *_cpu) {\
    SUBmac(reg, addMode, clockcycles, 1)\
    return clockcycles;\
}
makeCMP(imm, 2)
makeCMP(zpg, 3)
makeCMP(zpgx, 4)
makeCMP(abss, 4)
makeCMP(absx, 4)
makeCMP(absy, 4)
makeCMP(xind, 6)
makeCMP(indy, 5)
// CPX - compare memory and index X
makeCP_(X, imm, 2)
makeCP_(X, zpg, 3)
makeCP_(X, abss, 4)
// CPY - compare memory and index Y
makeCP_(Y, imm, 2)
makeCP_(Y, zpg, 3)
makeCP_(Y, abss, 4)

#define doROR() uint8_t carry = val & 1;\
    uint8_t newV = ((_cpu->flags & FLAG_C) << 7) | (val >> 1);\
    doNZ(_cpu, newV);\
    setFlag(_cpu, FLAG_C, val & 1);\

// ROR - rotate one bit right
#define makeROR(addMode, clockcycles) int ROR_##addMode (mos6502 *_cpu) {\
    uint16_t address = addMode(_cpu);\
    uint8_t val = read_mos6502(_cpu, address);\
    doROR()\
    write_mos6502(_cpu, address, newV);\
    return clockcycles;\
}
makeROR(zpg, 5)
makeROR(zpgx, 6)
makeROR(abss, 6)
makeROR(absx, 7)

int RORA(mos6502* _cpu) { // for accumulator
	uint8_t val = _cpu->A;
	doROR()
	_cpu->A = newV;
	return 2;
}

#define makeST(reg, addMode, clockcycles) int ST##reg##_##addMode (mos6502 *_cpu) {\
    write_mos6502(_cpu, addMode(_cpu), _cpu->reg);\
    return clockcycles;\
}

#define makeST2(reg, reg2, addMode, clockcycles) int S##reg##reg2##_##addMode (mos6502 *_cpu) {\
    write_mos6502(_cpu, addMode(_cpu), _cpu->reg & _cpu->reg2);\
    return clockcycles;\
}

#define makeST3(reg, addMode) int S##reg##A_##addMode (mos6502 *_cpu) {\
    uint16_t address = addMode(_cpu);\
	write_mos6502(_cpu, address, _cpu->reg & (address >> 8) + 1);\
	return 5;\
}

// STA - store accumulator in memory
makeST(A, zpg, 3)
makeST(A, zpgx, 4)
makeST(A, abss, 4)
makeST(A, absx, 5)
makeST(A, absy, 5)
makeST(A, xind, 6)
makeST(A, indy, 6)
// STX - store index X in memory
makeST(X, zpg, 3)
makeST(X, zpgy, 4)
makeST(X, abss, 4)
// STY - store index Y in memory
makeST(Y, zpg, 3)
makeST(Y, zpgx, 4)
makeST(Y, abss, 4)
// SAX - AND index X with accumulator and store in memory **UNOFFICIAL
makeST2(A, X, zpg, 3)
makeST2(A, X, xind, 3)
makeST2(A, X, abss, 3)
makeST2(A, X, zpgy, 3)
// S[reg]A - AND index reg with high byte of target address of argument + 1, store result in memory **UNOFFICIAL
makeST3(X, absy) // SXA
makeST3(Y, absx) // SYA

#define makeT(r1, r2) int T##r1##r2(mos6502 *_cpu) {\
    _cpu->r2 = _cpu->r1;\
    doNZ(_cpu, _cpu->r1);\
    return 2;\
}
makeT(A, X) // TAX - transfer accumulator to index X
makeT(A, Y) // TAY - transfer accumulator to index Y
makeT(SP, X) // TSX - transfer stack pointer to index X
makeT(X, A) // TXA - transfer index X to accumulator
makeT(Y, A) // TYA - transfer index Y to accumulator

// TXS - transfer index X to stack register
int TXS(mos6502* _cpu) {
	_cpu->SP = _cpu->X;
	return 2;
}

#define makeLD(reg, addMode, clockcycles) int LD##reg##_##addMode(mos6502 *_cpu) {\
    _cpu->reg = read_mos6502(_cpu, addMode(_cpu));\
    doNZ(_cpu, _cpu->reg);\
    return clockcycles;\
}
#define makeLD2(reg, reg2, addMode, clockcycles) int L##reg##reg2##_##addMode(mos6502 *_cpu) {\
    _cpu->reg = read_mos6502(_cpu, addMode(_cpu));\
    _cpu->reg2 = _cpu->reg;\
    doNZ(_cpu, _cpu->reg);\
    return clockcycles;\
}
// LDA - load accumulator with memory
makeLD(A, imm, 2)
makeLD(A, zpg, 3)
makeLD(A, zpgx, 4)
makeLD(A, abss, 4)
makeLD(A, absx, 4)
makeLD(A, absy, 4)
makeLD(A, xind, 6)
makeLD(A, indy, 5)
// LDX - load index X with memory
makeLD(X, imm, 2)
makeLD(X, zpg, 3)
makeLD(X, zpgy, 4)
makeLD(X, abss, 4)
makeLD(X, absy, 4)
// LDY - load index Y with memory
makeLD(Y, imm, 2)
makeLD(Y, zpg, 3)
makeLD(Y, zpgx, 4)
makeLD(Y, abss, 4)
makeLD(Y, absx, 4)
// LAX - load accumulator and index X with the same memory **UNOFFICIAL
makeLD2(A, X, xind, 6);
makeLD2(A, X, zpg, 3);
makeLD2(A, X, abss, 4);
makeLD2(A, X, indy, 4);
makeLD2(A, X, zpgy, 4);
makeLD2(A, X, absy, 4);

#define makeB_C(flag, clockcycles) int B##flag##C (mos6502 *_cpu) {\
    uint16_t add = rel(_cpu);\
    if (!testFlag(_cpu, FLAG_##flag)) { _cpu->PC = add; }\
    return clockcycles;\
}

#define makeB_S(flag, clockcycles) int B##flag##S (mos6502 *_cpu) {\
    uint16_t add = rel(_cpu);\
    if (testFlag(_cpu, FLAG_##flag)) { _cpu->PC = add; }\
    return clockcycles;\
}
makeB_C(C, 2) // BCC - branch on carry clear
makeB_S(C, 2) // BCS - branch on carry set
makeB_C(Z, 2) // BNE - branch on result not zero
makeB_S(Z, 2) // BEQ - branch on result zero
makeB_C(V, 2) // BVC - branch on overflow clear
makeB_S(V, 2) // BVS - branch on overflow set
makeB_C(N, 2) // BPL - branch on result positive
makeB_S(N, 2) // BMI - branch on result negative

// INC - increment memory by one
#define makeINC(addMode, clockcycles) int INC_##addMode(mos6502 *_cpu) {\
    /*printPage(_cpu, 0);*/\
    uint16_t address = addMode(_cpu);\
    uint8_t val = read_mos6502(_cpu, address) + 1;\
    doNZ(_cpu, val);\
    /*printf("inc %04x %i\n", address, val);*/\
    write_mos6502(_cpu, address, val);\
    return clockcycles;\
}
makeINC(zpg, 5)
makeINC(zpgx, 6)
makeINC(abss, 6)
makeINC(absx, 7)

#define makeIN_(reg) int IN##reg (mos6502 *_cpu) {\
    ++_cpu->reg;\
    doNZ(_cpu, _cpu->reg);\
    return 2;\
}
makeIN_(X) // INX - increment index X by one
makeIN_(Y) // INY - increment index Y by one

// DEC - decrement memory by one
#define makeDEC(addMode, clockcycles) int DEC_##addMode (mos6502 *_cpu) {\
    uint16_t address = addMode(_cpu);\
    uint8_t val = read_mos6502(_cpu, address) - 1;\
    write_mos6502(_cpu, address, val);\
    doNZ(_cpu, val);\
    return clockcycles;\
}
makeDEC(zpg, 5)
makeDEC(zpgx, 6)
makeDEC(abss, 6)
makeDEC(absx, 7)

#define makeDE_(reg) int DE##reg (mos6502 *_cpu) {\
    --_cpu->reg;\
    doNZ(_cpu, _cpu->reg);\
    return 2;\
}
makeDE_(X) // DEX - decrement index X by one
makeDE_(Y) // DEY - decrement index Y by one

// DCP - subtract 1 from memory (without borrow)
#define makeDCP(addMode, clockcycles) int DCP_##addMode(mos6502 *_cpu) {\
	uint16_t address = addMode(_cpu);\
	uint8_t val = read_mos6502(_cpu, address) - 1;\
	write_mos6502(_cpu, address, val);\
	doNZC(_cpu, _cpu->A);\
	return clockcycles;\
}
makeDCP(zpg, 5);
makeDCP(zpgx, 6);
makeDCP(abss, 6);
makeDCP(absx, 7);
makeDCP(absy, 7);
makeDCP(xind, 8);
makeDCP(indy, 8);

// PLA - pull accumulator from stack
int PLA(mos6502* _cpu) {
	_cpu->A = pop(_cpu);
	doNZ(_cpu, _cpu->A);
	return 4;
}

// PHA - push accumulator to stack
int PHA(mos6502* _cpu) {
	push(_cpu, _cpu->A);
	return 3;
}

// PHP - pull processor status from stack
int PLP(mos6502* _cpu) {
	_cpu->flags = (pop(_cpu) & 0xCF) | (_cpu->flags & 0x30);//all bits but 4 and 5
	return 4;
}

// PHP - push processor status to stack
int PHP(mos6502* _cpu) {
	push(_cpu, _cpu->flags | 0x30);
	//setFlags(_cpu, 0x30);
	return 3;
}

// RTI - return from interrupt
int RTI(mos6502* _cpu) {
	printPage(_cpu, 1);
	_cpu->flags = pop(_cpu) | FLAG_X;
	_cpu->PC = pop(_cpu);
	_cpu->PC += (pop(_cpu) << 8);
	return 6;
}

// RTS - return from subroutine
int RTS(mos6502* _cpu) {
	_cpu->PC = pop(_cpu) + 1;
	_cpu->PC += (pop(_cpu) << 8);
	return 6;
}

int ERR(mos6502* _cpu) {
	getc(stdin);
	return 10000000;
}

#define makeNOP(addMode, clockcycles)int NOP_##addMode(mos6502 *_cpu) {\
    addMode(_cpu);\
    return clockcycles;\
}

// NOP - single no operation
int NOP(mos6502* _cpu) {
	return 2;
}
// DOP - double NOP
makeNOP(imm, 2)
makeNOP(zpg, 3)
makeNOP(zpgx, 4)
// TOP - triple NOP
makeNOP(abss, 4)
makeNOP(absx, 4)


static const mos6502instruction cpuopmap[256] = {
    //00   , 01      , 02      , 03      , 04      , 05      , 06      , 07      , 08 , 09      , 0A  , 0B      , 0C      , 0D      , 0E      , 0F
    BRK    , ORA_xind, ERR     , SLO_xind, NOP_zpg , ORA_zpg , ASL_zpg , SLO_zpg , PHP, ORA_imm , ASLA, ERR     , NOP_abss, ORA_abss, ASL_abss, SLO_abss,//00
    BNC    , ORA_indy, ERR     , SLO_indy, NOP_zpgx, ORA_zpgx, ASL_zpgx, SLO_zpgx, CLC, ORA_absy, NOP , SLO_absy, NOP_absx, ORA_absx, ASL_absx, SLO_absx,//10
    JSR    , AND_xind, ERR     , ERR     , BIT_zpg , AND_zpg , ROL_zpg , ERR     , PLP, AND_imm , ROLA, ERR     , BIT_abss, AND_abss, ROL_abss, ERR     ,//20
    BNS    , AND_indy, ERR     , ERR     , NOP_zpgx, AND_zpgx, ROL_zpgx, ERR     , SEC, AND_absy, NOP , ERR     , NOP_absx, AND_absx, ROL_absx, ERR     ,//30
    RTI    , EOR_xind, ERR     , SRE_xind, NOP_zpg , EOR_zpg , LSR_zpg , SRE_zpg , PHA, EOR_imm , LSRA, ERR     , JMP_abss, EOR_abss, LSR_abss, SRE_abss,//40
    BVC    , EOR_indy, ERR     , SRE_indy, NOP_zpgx, EOR_zpgx, LSR_zpgx, SRE_zpgx, CLI, EOR_absy, NOP , SRE_absy, NOP_absx, EOR_absx, LSR_absx, SRE_absx,//50
    RTS    , ADC_xind, ERR     , ERR     , NOP_zpg , ADC_zpg , ROR_zpg , ERR     , PLA, ADC_imm , RORA, ERR     , JMP_ind , ADC_abss, ROR_abss, ERR     ,//60
    BVS    , ADC_indy, ERR     , ERR     , NOP_zpgx, ADC_zpgx, ROR_zpgx, ERR     , SEI, ADC_absy, NOP , ERR     , NOP_absx, ADC_absx, ROR_absx, ERR     ,//70
    NOP_imm, STA_xind, ERR     , SAX_xind, STY_zpg , STA_zpg , STX_zpg , SAX_zpg , DEY, ERR     , TXA , ERR     , STY_abss, STA_abss, STX_abss, SAX_abss,//80
    BCC    , STA_indy, ERR     , ERR     , STY_zpgx, STA_zpgx, STX_zpgy, SAX_zpgy, TYA, STA_absy, TXS , ERR     , SYA_absx, STA_absx, SXA_absy, ERR     ,//90
    LDY_imm, LDA_xind, LDX_imm , LAX_xind, LDY_zpg , LDA_zpg , LDX_zpg , LAX_zpg , TAY, LDA_imm , TAX , ERR     , LDY_abss, LDA_abss, LDX_abss, LAX_abss,//A0
    BCS    , LDA_indy, ERR     , LAX_indy, LDY_zpgx, LDA_zpgx, LDX_zpgy, LAX_zpgy, CLV, LDA_absy, TSPX, ERR     , LDY_absx, LDA_absx, LDX_absy, LAX_absy,//B0
    CPY_imm, CMP_xind, ERR     , DCP_xind, CPY_zpg , CMP_zpg , DEC_zpg , DCP_zpg , INY, CMP_imm , DEX , ERR     , CPY_abss, CMP_abss, DEC_abss, DCP_abss,//C0
    BZC    , CMP_indy, ERR     , DCP_indy, NOP_zpgx, CMP_zpgx, DEC_zpgx, DCP_zpgx, CLD, CMP_absy, NOP , DCP_absy, NOP_absx, CMP_absx, DEC_absx, DCP_absx,//D0
    CPX_imm, SBC_xind, ERR     , ERR     , CPX_zpg , SBC_zpg , INC_zpg , ERR     , INX, SBC_imm , NOP , SBC_imm , CPX_abss, SBC_abss, INC_abss, ERR     ,//E0
    BZS    , SBC_indy, ERR     , ERR     , NOP_zpgx, SBC_zpgx, INC_zpgx, ERR     , SED, SBC_absy, NOP , ERR     , NOP_absx, SBC_absx, INC_absx, ERR     ,//F0
};

const char* instructions[256] = { "BRK","ORA_xind","ERR","SLO_xind","NOP_zpg","ORA_zpg","ASL_zpg","SLO_zpg","PHP","ORA_imm","ASLA","ERR","NOP_abss","ORA_abss","ASL_abss","SLO_abss","BNC","ORA_indy","ERR","SLO_indy","NOP_zpgx","ORA_zpgx","ASL_zpgx","SLO_zpgx","CLC","ORA_absy","NOP","SLO_absy","NOP_absx","ORA_absx","ASL_absx","SLO_absx","JSR","AND_xind","ERR","ERR","BIT_zpg","AND_zpg","ROL_zpg","ERR","PLP","AND_imm","ROLA","ERR","BIT_abss","AND_abss","ROL_abss","ERR","BNS","AND_indy","ERR","ERR","NOP_zpgx","AND_zpgx","ROL_zpgx","ERR","SEC","AND_absy","NOP","ERR","NOP_absx","AND_absx","ROL_absx","ERR","RTI","EOR_xind","ERR","SRE_xind","NOP_zpg","EOR_zpg","LSR_zpg","SRE_zpg","PHA","EOR_imm","LSRA","ERR","JMP_abss","EOR_abss","LSR_abss","SRE_abss","BVC","EOR_indy","ERR","SRE_indy","NOP_zpgx","EOR_zpgx","LSR_zpgx","SRE_zpgx","CLI","EOR_absy","NOP","SRE_absy","NOP_absx","EOR_absx","LSR_absx","SRE_absx","RTS","ADC_xind","ERR","ERR","NOP_zpg","ADC_zpg","ROR_zpg","ERR","PLA","ADC_imm","RORA","ERR","JMP_ind","ADC_abss","ROR_abss","ERR","BVS","ADC_indy","ERR","ERR","NOP_zpgx","ADC_zpgx","ROR_zpgx","ERR","SEI","ADC_absy","NOP","ERR","NOP_absx","ADC_absx","ROR_absx","ERR","NOP_imm","STA_xind","ERR","SAX_xind","STY_zpg","STA_zpg","STX_zpg","SAX_zpg","DEY","ERR","TXA","ERR","STY_abss","STA_abss","STX_abss","SAX_abss","BCC","STA_indy","ERR","ERR","STY_zpgx","STA_zpgx","STX_zpgy","SAX_zpgy","TYA","STA_absy","TXS","ERR","SYA_absx","STA_absx","SXA_absy","ERR","LDY_imm","LDA_xind","LDX_imm","LAX_xind","LDY_zpg","LDA_zpg","LDX_zpg","LAX_zpg","TAY","LDA_imm","TAX","ERR","LDY_abss","LDA_abss","LDX_abss","LAX_abss","BCS","LDA_indy","ERR","LAX_indy","LDY_zpgx","LDA_zpgx","LDX_zpgy","LAX_zpgy","CLV","LDA_absy","TSPX","ERR","LDY_absx","LDA_absx","LDX_absy","LAX_absy","CPY_imm","CMP_xind","ERR","DCP_xind","CPY_zpg","CMP_zpg","DEC_zpg","DCP_zpg","INY","CMP_imm","DEX","ERR","CPY_abss","CMP_abss","DEC_abss","DCP_abss","BZC","CMP_indy","ERR","DCP_indy","NOP_zpgx","CMP_zpgx","DEC_zpgx","DCP_zpgx","CLD","CMP_absy","NOP","DCP_absy","NOP_absx","CMP_absx","DEC_absx","DCP_absx","CPX_imm","SBC_xind","ERR","ERR","CPX_zpg","SBC_zpg","INC_zpg","ERR","INX","SBC_imm","NOP","SBC_imm","CPX_abss","SBC_abss","INC_abss","ERR","BZS","SBC_indy","ERR","ERR","NOP_zpgx","SBC_zpgx","INC_zpgx","ERR","SED","SBC_absy","NOP","ERR","NOP_absx","SBC_absx","INC_absx","ERR" };

#define BYTE_TO_FLAGS(byte)  \
  (byte & 0x80 ? 'N' : '-'), \
  (byte & 0x40 ? 'V' : '-'), \
  (byte & 0x20 ? 'x' : '-'), \
  (byte & 0x10 ? 'B' : '-'), \
  (byte & 0x08 ? 'D' : '-'), \
  (byte & 0x04 ? 'I' : '-'), \
  (byte & 0x02 ? 'Z' : '-'), \
  (byte & 0x01 ? 'C' : '-')

int counter = 0;
//#define testNes
// executes next instruction
int stepCpu(mos6502* _cpu) {
	//printf("running instruction from 0x%04X\n", _cpu->PC);
	uint8_t opcode = read_mos6502(_cpu, _cpu->PC++);
#ifdef testNes
	if (pc_expected[counter] != _cpu->PC - 1 || opcode_expected[counter] != opcode || a_expected[counter] != _cpu->A || x_expected[counter] != _cpu->X ||
		y_expected[counter] != _cpu->Y || flag_expected[counter] != _cpu->flags || sp_expected[counter] != _cpu->SP) {

		printf("\n%i\t-----------------------------------------------------------------------------------------------------------\n", counter);
		printf("| EXPECTED ==>\t 0x%04X 0x%02X (%-9s), A: 0x%02X, X: 0x%02X, Y: 0x%02X, FLAGS: %c%c%c%c%c%c%c%c, SP: 0x%02X\n",
			pc_expected[counter], opcode_expected[counter], instructions[opcode_expected[counter]],
			a_expected[counter], x_expected[counter], y_expected[counter], BYTE_TO_FLAGS(flag_expected[counter]),
			sp_expected[counter]);

		printf("| ACTUAL   ==>\t 0x%04X 0x%02X (%-9s), A: 0x%02X, X: 0x%02X, Y: 0x%02X, FLAGS: %c%c%c%c%c%c%c%c, SP: 0x%02X\n",
			_cpu->PC - 1, opcode, instructions[opcode], _cpu->A, _cpu->X, _cpu->Y, BYTE_TO_FLAGS(_cpu->flags),
			_cpu->SP);

		printf("| NOT SAME ==> \t");
		if (pc_expected[counter] != _cpu->PC - 1) {
			printf(" !!PC!! ");
		}
		if (opcode_expected[counter] != opcode) {
			printf(" !!OPCODE!! ");
		}
		if (a_expected[counter] != _cpu->A) {
			printf(" !!A!! ");
		}
		if (x_expected[counter] != _cpu->X) {
			printf(" !!X!! ");
		}
		if (y_expected[counter] != _cpu->Y) {
			printf(" !!Y!! ");
		}
		if (flag_expected[counter] != _cpu->flags) {
			printf(" !!FLAGS!! ");
		}
		if (sp_expected[counter] != _cpu->SP) {
			printf(" !!SP!! ");
		}
	}
	else {
		printf("| %i) CORRECT ==>\t 0x%04X 0x%02X (%-9s), A: 0x%02X, X: 0x%02X, Y: 0x%02X, FLAGS: %c%c%c%c%c%c%c%c, SP: 0x%02X\n",
			counter, pc_expected[counter], opcode_expected[counter], instructions[opcode_expected[counter]],
			a_expected[counter], x_expected[counter], y_expected[counter], BYTE_TO_FLAGS(flag_expected[counter]),
			sp_expected[counter]);
	}
	//puts("\n-------------------------------------------------------------------------------------------------------------------\n");


	//fprintf(stdout, "RUNNING 0x%04X 0x%02X\n",  _cpu->PC-1, opcode);
	counter++;
#endif
    printf("| ACTUAL   ==>\t 0x%04X 0x%02X (%-9s), A: 0x%02X, X: 0x%02X, Y: 0x%02X, FLAGS: %c%c%c%c%c%c%c%c, SP: 0x%02X\n",
           _cpu->PC - 1, opcode, instructions[opcode], _cpu->A, _cpu->X, _cpu->Y, BYTE_TO_FLAGS(_cpu->flags),
           _cpu->SP);
	return cpuopmap[opcode](_cpu);

}