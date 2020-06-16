#include "cpu.h"

#include <stdio.h>
#include <stdlib.h>

/************************************************
 *  PUBLIC FUNCTIONS
 ***********************************************/

void createCpu(mos6502 *_cpu) {
    _cpu->A = 0;
    _cpu->PC = 0x8000;
    _cpu->SP = 0xFF;
    _cpu->flags = 0;
    _cpu->X = 0;
    _cpu->Y = 0;
    _cpu->interrupts = 0;
    _cpu->devices = nullptr;
    _cpu->deviceCount = 0;
    printf("created cpu\n");
}

bool addDevice(mos6502 *_cpu, const device816 *dev) {
    device816 *newdevs;
    if (_cpu->deviceCount == 0) {
        _cpu->deviceCount++;
        newdevs = (device816 *) malloc(_cpu->deviceCount * sizeof(device816));
    } else {
        _cpu->deviceCount++;
        newdevs = (device816 *) realloc(_cpu->devices, _cpu->deviceCount * sizeof(device816));
    }
    if (newdevs == nullptr) {
        free(_cpu->devices);
        return false;
    } else {
        _cpu->devices = newdevs;
        _cpu->devices[_cpu->deviceCount - 1] = *dev;
        return true;
    }
}

/************************************************
 *  BASIC READ/WRITE
 ***********************************************/

uint8_t basicRead(mos6502 *_cpu, uint16_t address) {
    uint8_t val = 0;
    for (size_t i = 0; i < _cpu->deviceCount; i++) {
        device816* dev = &_cpu->devices[i];
        if (dev->start <= address && dev->start + dev->length > address) {
            val = dev->readfun(dev->data, address - dev->start);
        }
    }
    printf("read %X %X\n", address, val);
    return val;
}

void basicWrite(mos6502 *_cpu, uint16_t address, uint8_t value) {
    printf("write %X %X\n", address, value);
    for (size_t i = 0; i < _cpu->deviceCount; i++) {
        device816 *dev = &(_cpu->devices[i]);
        if (dev->start <= address && dev->start + dev->length > address) {
            dev->writefun(dev->data, address - dev->start, value);
        }
    }
}

void push(mos6502 *_cpu, uint8_t value) {
    basicWrite(_cpu, 0x100 + (_cpu->SP--), value);
}

uint8_t pop(mos6502 *_cpu) {
    return basicRead(_cpu, 0x100 + (++_cpu->SP));
}


/************************************************
 *  FLAG FUNCTIONS
 ***********************************************/

#define FLAG_N 0b10000000
#define FLAG_V 0b01000000
#define FLAG_B 0b00010000
#define FLAG_D 0b00001000
#define FLAG_I 0b00000100
#define FLAG_Z 0b00000010
#define FLAG_C 0b00000001

inline void setFlags(mos6502 *_cpu, uint8_t flags) {
    _cpu->flags |= flags;
}

inline void setFlag(mos6502 *_cpu, uint8_t flag, bool state) {
    if (state) _cpu->flags |= flag;
    else _cpu->flags &= ~flag;
}

inline void unsetFlag(mos6502 *_cpu, uint8_t flag) {
    _cpu->flags &= ~flag;
}

inline bool testFlag(mos6502 *_cpu, uint8_t flag) {
    return _cpu->flags & flag;
}

inline void donz(mos6502 *_cpu, uint8_t val) {
    setFlag(_cpu, FLAG_N, val & 0x80);
    setFlag(_cpu, FLAG_Z, !val);
}

inline void donzc(mos6502 *_cpu, uint16_t val) {
    setFlag(_cpu, FLAG_N, val & 0x80);
    setFlag(_cpu, FLAG_Z, !(val & 0xff));
    setFlag(_cpu, FLAG_C, val & 0x100);
}

/************************************************
 *  INTERRUPT FUNCTIONS
 ***********************************************/

#define IRQ_VEC 0xFFFE
#define NMI_VEC 0xFFFA
#define BRK_VEC 0xFFFE
#define RST_VEC 0xFFFC

void triggerNMI(mos6502 *_cpu) {
    _cpu->PC += 2;
    push(_cpu, _cpu->PC >> 8);
    push(_cpu, _cpu->PC & 0xf);
    push(_cpu, _cpu->flags);
    setFlags(_cpu, FLAG_I);
    _cpu->PC = basicRead(_cpu, NMI_VEC);
    _cpu->PC |= basicRead(_cpu, NMI_VEC + 1) << 8;
}

void triggerRST(mos6502 *_cpu) {
    _cpu->PC += 2;
    push(_cpu, _cpu->PC >> 8);
    push(_cpu, _cpu->PC & 0xf);
    push(_cpu, _cpu->flags);
    setFlags(_cpu, FLAG_I);
    _cpu->PC = basicRead(_cpu, RST_VEC);
    _cpu->PC |= basicRead(_cpu, RST_VEC + 1) << 8;

}

void triggerIRQ(mos6502 *_cpu) {
    _cpu->PC += 2;
    push(_cpu, _cpu->PC >> 8);
    push(_cpu, _cpu->PC & 0xf);
    push(_cpu, _cpu->flags);
    setFlags(_cpu, FLAG_I);
    _cpu->PC = basicRead(_cpu, IRQ_VEC);
    _cpu->PC |= basicRead(_cpu, IRQ_VEC + 1) << 8;
}

/************************************************
 *  ADDRESS MODES
 ***********************************************/

uint16_t abss(mos6502 *_cpu) {
    uint16_t address = basicRead(_cpu, _cpu->PC) | (basicRead(_cpu, _cpu->PC + 1) << 8);
    _cpu->PC += 2;
    return address;

}

uint8_t accRead(mos6502 *_cpu) {
    return _cpu->A;
}

void accWrite(mos6502 *_cpu, uint8_t val) {
    _cpu->A = val;
}

uint16_t absx(mos6502 *_cpu) {
    uint16_t ret = (basicRead(_cpu, _cpu->PC) | (basicRead(_cpu, _cpu->PC + 1) << 8)) + _cpu->X;
    _cpu->PC += 2;
    return ret;
}

uint16_t absy(mos6502 *_cpu) {
    uint16_t ret = (basicRead(_cpu, _cpu->PC) | (basicRead(_cpu, _cpu->PC + 1) << 8)) + _cpu->Y;
    _cpu->PC += 2;
    return ret;
}

uint16_t imm(mos6502 *_cpu) {
    return _cpu->PC++;
}

uint16_t ind(mos6502 *_cpu) {
    uint16_t address = (basicRead(_cpu, _cpu->PC) | (basicRead(_cpu, _cpu->PC + 1) << 8));
    uint16_t v = basicRead(_cpu, address) | (basicRead(_cpu, address + 1) << 8);
    _cpu->PC += 2;
    return v;
}

uint16_t xind(mos6502 *_cpu) {
    uint16_t address = (basicRead(_cpu, _cpu->PC) | (basicRead(_cpu, _cpu->PC + 1) << 8)) + _cpu->X;
    uint16_t v = basicRead(_cpu, address) | (basicRead(_cpu, address + 1) << 8);
    _cpu->PC += 2;
    return v;
}

uint16_t indy(mos6502 *_cpu) {
    uint16_t address = (basicRead(_cpu, _cpu->PC) | (basicRead(_cpu, _cpu->PC + 1) << 8));
    uint16_t v = (uint8_t) (basicRead(_cpu, address) | (basicRead(_cpu, address + 1) << 8) + _cpu->Y);
    _cpu->PC += 2;
    return v;
}

uint16_t inline zpg(mos6502 *_cpu) {
    uint16_t val = basicRead(_cpu, _cpu->PC);
    _cpu->PC += 1;
    return val;
}

uint16_t inline zpgx(mos6502 *_cpu) {
    uint16_t val = (uint8_t) (basicRead(_cpu, _cpu->PC) + _cpu->X);
    _cpu->PC += 1;
    return val;
}

uint16_t inline zpgy(mos6502 *_cpu) {
    uint16_t val = (uint8_t) (basicRead(_cpu, _cpu->PC) + _cpu->Y);
    _cpu->PC += 1;
    return val;
}

uint16_t inline rel(mos6502 *_cpu) {
    return (int8_t) basicRead(_cpu, _cpu->PC++) + _cpu->PC;
}

/************************************************
 *  INSTRUCTIONS
 ***********************************************/

int NOP(mos6502 *_cpu) {
    printf("nop at %X\n", _cpu->PC);
    return 2;
}

int BRK(mos6502 *_cpu) {
    _cpu->PC += 2;
    push(_cpu, _cpu->PC >> 8);
    push(_cpu, _cpu->PC & 0xf);
    setFlags(_cpu, FLAG_B);
    push(_cpu, _cpu->flags);
    setFlags(_cpu, FLAG_I);
    _cpu->PC = basicRead(_cpu, IRQ_VEC);
    _cpu->PC |= basicRead(_cpu, IRQ_VEC + 1) << 8;
    return 7;
//exit(1);
}//7 cycles ----------------IMPLEMENT THIS WHEN I KNOW WHAT IT DOES---------------------------

#define makeCL(flag) int CL##flag(mos6502 *_cpu) {\
    unsetFlag(_cpu, FLAG_##flag);\
    return 2;\
}
makeCL(C)
makeCL(I)
makeCL(V)
makeCL(D)

#define makeSE(flag) int SE##flag(mos6502 *_cpu) {\
    setFlags(_cpu, FLAG_##flag);\
    return 2;\
}
makeSE(C)
makeSE(I)
makeSE(D)

#define makeORA(addMode, clockcycles) int ORA_##addMode (mos6502 *_cpu) {\
    uint8_t v = _cpu->A | basicRead(_cpu, addMode(_cpu));\
    _cpu->A = v;\
    donz(_cpu, v);\
    return clockcycles;\
}
makeORA(imm, 2)
makeORA(zpg, 3)
makeORA(zpgx, 4)
makeORA(abss, 4)
makeORA(xind, 6)
makeORA(indy, 5)
makeORA(absx, 4)
makeORA(absy, 4)

#define makeASL(addMode, clockcycles) int ASL_##addMode (mos6502 *_cpu) {\
    uint16_t address = addMode(_cpu);\
    uint16_t v = basicRead(_cpu, address) << 1;\
    basicWrite(_cpu, address, (uint8_t) v);\
    donzc(_cpu, v);\
    return clockcycles;\
}
makeASL(zpg, 5)
makeASL(zpgx, 6)
makeASL(abss, 6)
makeASL(absx, 7)

int ASLA(mos6502 *_cpu) {
    uint16_t v = _cpu->A << 1;
    _cpu->A = (uint8_t) v;
    donzc(_cpu, v);
    return 2;
}

#define makeJSR(addMode, clockcycles) int JSR(mos6502 *_cpu) {\
    uint16_t v = addMode(_cpu);\
    _cpu->PC += 2;\
    push(_cpu, _cpu->PC & 0xf);\
    push(_cpu, _cpu->PC >> 8);\
    _cpu->PC = v;\
    return clockcycles;\
}// 6 cycles
makeJSR(abss, 6)

#define makeBIT(addMode, clockcycles) int BIT_##addMode (mos6502 *_cpu) {\
    uint8_t res = _cpu->A & basicRead(_cpu, addMode(_cpu));\
    donz(_cpu, res);\
    setFlag(_cpu, FLAG_V, res & 0x40);\
    return clockcycles;\
}
makeBIT(zpg, 3)
makeBIT(abss, 4)

#define makeAND(addMode, clockcycles) int AND_##addMode (mos6502 *_cpu) {\
    uint8_t v = _cpu->A & basicRead(_cpu, addMode(_cpu));\
    _cpu->A = v;\
    donz(_cpu, v);\
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

#define makeROL(addMode, clockcycles) int ROL_##addMode (mos6502 *_cpu) {\
    uint16_t address = addMode(_cpu);\
    uint8_t v = basicRead(_cpu, address);\
    v = (v << 1) | (v >> 7);\
    basicWrite(_cpu, address, v);\
    donz(_cpu, v);\
    setFlag(_cpu, FLAG_C, v & 1);\
    return clockcycles;\
}
makeROL(zpg, 5)
makeROL(zpgx, 6)
makeROL(abss, 6)
makeROL(absx, 7)

int ROLA(mos6502 *_cpu) {
    uint8_t v = _cpu->A;
    v = (v << 1) | (v >> 7);
    _cpu->A = v;
    donz(_cpu, v);
    setFlag(_cpu, FLAG_C, v & 1);
    return 2;
}

#define makeJMP(addMode, clockcycles) int JMP_##addMode (mos6502 *_cpu) {\
    _cpu->PC = addMode(_cpu);\
    return clockcycles;\
}
makeJMP(abss, 3)
makeJMP(ind, 5)


#define makeLSR(addMode, clockcycles) int LSR_##addMode (mos6502 *_cpu) {\
    uint16_t address = addMode(_cpu);\
    uint8_t rval = basicRead(_cpu, address);\
    uint8_t wval = rval >> 1;\
    basicWrite(_cpu, address, wval);\
    donz(_cpu, wval);\
    setFlag(_cpu, FLAG_C, rval & 1);\
    return clockcycles;\
}
makeLSR(zpg, 3)
makeLSR(zpgx, 4)
makeLSR(abss, 4)
makeLSR(absx, 5)


int LSRA(mos6502 *_cpu) {
    uint8_t rval = _cpu->A;
    uint8_t wval = rval >> 1;
    _cpu->A = wval;
    donz(_cpu, wval);
    setFlag(_cpu, FLAG_C, rval & 1);
    return 2;
}

#define makeEOR(addMode, clockcycles) int EOR_##addMode (mos6502 *_cpu) {\
    _cpu->A ^= basicRead(_cpu, addMode(_cpu));\
    donz(_cpu, _cpu->A);\
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

#define makeADC(addMode, clockcycles) int ADC_##addMode (mos6502 *_cpu) {\
    uint8_t v = basicRead(_cpu, addMode(_cpu));\
    uint8_t mayover = ~(v ^ _cpu->A);\
    uint16_t total = v + _cpu->A + (testFlag(_cpu, FLAG_C) ? 1 : 0);\
    _cpu->A = (uint8_t) total;\
    donzc(_cpu, total);\
    setFlag(_cpu, FLAG_V, mayover & (v ^ _cpu->A) & 0x80);\
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

#define makeSBC(addMode, clockcycles) int SBC_##addMode(mos6502 *_cpu) {\
    uint8_t v = ~basicRead(_cpu, addMode(_cpu));\
    uint16_t val = _cpu->A - v - (testFlag(_cpu, FLAG_C) ? 1 : 0);\
    _cpu->A = (uint8_t) val;\
    donzc(_cpu, val);\
    setFlag(_cpu, FLAG_V, (v ^ _cpu->A) & 0x80);\
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

#define makeCMP(addMode, clockcycles) int CMP_##addMode (mos6502 *_cpu) {\
    uint16_t v = _cpu->A - basicRead(_cpu, addMode(_cpu));\
    donzc(_cpu, v);\
    return clockcycles;\
}
#define makeCP_(reg, addMode, clockcycles) int CP##reg##_##addMode (mos6502 *_cpu) {\
    uint16_t v = _cpu->reg - basicRead(_cpu, addMode(_cpu));\
    donzc(_cpu, v);\
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

makeCP_(X, imm, 2)
makeCP_(X, zpg, 3)
makeCP_(X, abss, 4)

makeCP_(Y, imm, 2)
makeCP_(Y, zpg, 3)
makeCP_(Y, abss, 4)

#define makeROR(addMode, clockcycles) int ROR_##addMode (mos6502 *_cpu) {\
    uint16_t address = addMode(_cpu);\
    uint8_t v = basicRead(_cpu, address);\
    v = (v >> 1) | (v << 7);\
    basicWrite(_cpu, address, v);\
    donz(_cpu, v);\
    setFlag(_cpu, FLAG_C, v & 0x80);\
    return clockcycles;\
}
makeROR(zpg, 5)
makeROR(zpgx, 6)
makeROR(abss, 6)
makeROR(absx, 7)

int RORA(mos6502 *_cpu) {
    uint8_t v = _cpu->A;
    v = (v >> 1) | (v << 7);
    _cpu->A = v;
    donz(_cpu, v);
    setFlag(_cpu, FLAG_C, v & 0x80);
    return 2;
}

#define makeST(reg, addMode, clockcycles) int ST##reg##_##addMode (mos6502 *_cpu) {\
    basicWrite(_cpu, addMode(_cpu), _cpu->reg);\
    return clockcycles;\
}
makeST(A, zpg, 3)
makeST(A, zpgx, 4)
makeST(A, abss, 4)
makeST(A, absx, 5)
makeST(A, absy, 5)
makeST(A, xind, 6)
makeST(A, indy, 6)

makeST(X, zpg, 3)
makeST(X, zpgy, 4)
makeST(X, abss, 4)

makeST(Y, zpg, 3)
makeST(Y, zpgx, 4)
makeST(Y, abss, 4)

#define makeT(r1, r2) int T##r1##r2(mos6502 *_cpu) {\
    _cpu->r2 = _cpu->r1;\
    donz(_cpu, _cpu->r1);\
    return 2;\
}
makeT(A,X)
makeT(A,Y)
makeT(SP,X)
makeT(X, A)
makeT(Y, A)

int TXS(mos6502 *_cpu) {
    _cpu->SP = _cpu->X;
    return 2;
}

#define makeLD(reg, addMode, clockcycles) int LD##reg##_##addMode(mos6502 *_cpu) {\
    _cpu->reg = basicRead(_cpu, addMode(_cpu));\
    donz(_cpu, _cpu->reg);\
    return clockcycles;\
}
makeLD(A, imm, 2)
makeLD(A, zpg, 3)
makeLD(A, zpgx, 4)
makeLD(A, abss, 4)
makeLD(A, absx, 4)
makeLD(A, absy, 4)
makeLD(A, xind, 6)
makeLD(A, indy, 5)

makeLD(X, imm, 2)
makeLD(X, zpg, 3)
makeLD(X, zpgy, 4)
makeLD(X, abss, 4)
makeLD(X, absy, 4)

makeLD(Y, imm, 2)
makeLD(Y, zpg, 3)
makeLD(Y, zpgx, 4)
makeLD(Y, abss, 4)
makeLD(Y, absx, 4)

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
makeB_C(C, 2)
makeB_S(C, 2)
makeB_C(Z, 2)//BNE
makeB_S(Z, 2)//BEQ
makeB_C(V, 2)
makeB_S(V, 2)
makeB_C(N, 2)//BPL
makeB_S(N, 2)//BMI

#define makeINC(addMode, clockcycles) int INC_##addMode(mos6502 *_cpu) {\
    uint16_t address = addMode(_cpu);\
    basicWrite(_cpu, address, basicRead(_cpu, address) + 1);\
    return clockcycles;\
}

#define makeIN_(reg) int IN##reg (mos6502 *_cpu) {\
    ++_cpu->reg;\
    donz(_cpu, _cpu->reg);\
    return 2;\
}

#define makeDEC(addMode, clockcycles) int DEC_##addMode (mos6502 *_cpu) {\
    uint16_t address = addMode(_cpu);\
    uint8_t val = basicRead(_cpu, address) - 1;\
    basicWrite(_cpu, address, val);\
    donz(_cpu, val);\
    return clockcycles;\
}

#define makeDE_(reg) int DE##reg (mos6502 *_cpu) {\
    --_cpu->reg;\
    donz(_cpu, _cpu->reg);\
    return 2;\
}
makeINC(zpg, 5)
makeDEC(zpg, 5)
makeINC(zpgx, 6)
makeDEC(zpgx, 6)
makeINC(abss, 6)
makeDEC(abss, 6)
makeINC(absx, 7)
makeDEC(absx, 7)
makeIN_(X)
makeDE_(X)
makeIN_(Y)
makeDE_(Y)

int PLA(mos6502 *_cpu) {
    _cpu->A = pop(_cpu);
    donz(_cpu, _cpu->A);
    return 4;
}

int PHA(mos6502 *_cpu) {
    push(_cpu, _cpu->A);
    return 3;
}

int PLP(mos6502 *_cpu) {
    _cpu->flags = pop(_cpu);
    return 4;
}

int PHP(mos6502 *_cpu) {
    push(_cpu, _cpu->flags);
    return 3;
}

int RTI(mos6502 *_cpu) {
    _cpu->flags = pop(_cpu);
    _cpu->PC = (pop(_cpu) << 8) | pop(_cpu);
    return 6;
}

int RTS(mos6502 *_cpu) {
    _cpu->PC = (pop(_cpu) << 8) + pop(_cpu);
    return 6;
}

int ERR(mos6502 *_cpu){
    getc(stdin);
    return 10000000;
}

static const mos6502instruction cpuopmap[256] = {
    //00   , 01      , 02     , 03 , 04      , 05      , 06      , 07 , 08 , 09      , 0A  , 0B , 0C      , 0D      , 0E      , 0F
    BRK    , ORA_xind, ERR    , ERR, ERR     , ORA_zpg , ASL_zpg , ERR, PHP, ORA_imm , ASLA, ERR, ERR     , ORA_abss, ASL_abss, ERR,//00
    BNC    , ORA_indy, ERR    , ERR, ERR     , ORA_zpgx, ASL_zpgx, ERR, CLC, ORA_absy, ERR , ERR, ERR     , ORA_absx, ASL_absx, ERR,//10
    JSR    , AND_xind, ERR    , ERR, BIT_zpg , AND_zpg , ROL_zpg , ERR, PLP, AND_imm , ROLA, ERR, BIT_abss, AND_abss, ROL_abss, ERR,//20
    BNS    , AND_indy, ERR    , ERR, ERR     , AND_zpgx, ROL_zpgx, ERR, SEC, AND_absy, ERR , ERR, ERR     , AND_absx, ROL_absx, ERR,//30
    RTI    , EOR_xind, ERR    , ERR, ERR     , EOR_zpg , LSR_zpg , ERR, PHA, EOR_imm , LSRA, ERR, JMP_abss, EOR_abss, LSR_abss, ERR,//40
    BVC    , EOR_indy, ERR    , ERR, ERR     , EOR_zpgx, LSR_zpgx, ERR, CLI, EOR_absy, ERR , ERR, ERR     , EOR_absx, LSR_absx, ERR,//50
    RTS    , ADC_xind, ERR    , ERR, ERR     , ADC_zpg , ROR_zpg , ERR, PLA, ADC_imm , RORA, ERR, JMP_ind , ADC_abss, ROR_abss, ERR,//60
    BVS    , ADC_indy, ERR    , ERR, ERR     , ADC_zpgx, ROR_zpgx, ERR, SEI, ADC_absy, ERR , ERR, ERR     , ADC_absx, ROR_absx, ERR,//70
    ERR    , STA_xind, ERR    , ERR, STY_zpg , STA_zpg , STX_zpg , ERR, DEY, ERR     , TXA , ERR, STY_abss, STA_abss, STX_abss, ERR,//80
    BCC    , STA_indy, ERR    , ERR, STY_zpgx, STA_zpgx, STX_zpgy, ERR, TYA, STA_absy, TXS , ERR, ERR     , STA_absx, ERR     , ERR,//90
    LDY_imm, LDA_xind, LDX_imm, ERR, LDY_zpg , LDA_zpg , LDX_zpg , ERR, TAY, LDA_imm , TAX , ERR, LDY_abss, LDA_abss, LDX_abss, ERR,//A0
    BCS    , LDA_indy, ERR    , ERR, LDY_zpgx, LDA_zpgx, LDX_zpgy, ERR, CLV, LDA_absy, TSPX, ERR, LDY_absx, LDA_absx, LDX_absy, ERR,//B0
    CPY_imm, CMP_xind, ERR    , ERR, CPY_zpg , CMP_zpg , DEC_zpg , ERR, INY, CMP_imm , DEX , ERR, CPY_abss, CMP_abss, DEC_abss, ERR,//C0
    BZC    , CMP_indy, ERR    , ERR, ERR     , CMP_zpgx, DEC_zpgx, ERR, CLD, CMP_absy, ERR , ERR, ERR     , CMP_absx, DEC_absx, ERR,//D0
    CPX_imm, SBC_xind, ERR    , ERR, CPX_zpg , SBC_zpg , INC_zpg , ERR, INX, SBC_imm , NOP , ERR, CPX_abss, SBC_abss, INC_abss, ERR,//E0
    BZS    , SBC_indy, ERR    , ERR, ERR     , SBC_zpgx, INC_zpgx, ERR, SED, SBC_absy, ERR , ERR, ERR     , SBC_absx, INC_absx, ERR,//F0
};

int stepCpu(mos6502 *_cpu) {
    //printf("running instruction from 0x%04X\n", _cpu->PC);
    uint8_t opcode = basicRead(_cpu, _cpu->PC++);
    printf("running 0x%04X 0x%02X\n",  _cpu->PC-1, opcode);
    return cpuopmap[opcode](_cpu);
}