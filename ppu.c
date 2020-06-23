#include "ppu.h"
#include "emulatorGlue.h"

#include <stdlib.h>
#include <stdio.h>

#define LINE_WIDTH 341
#define LINE_COUNT 262
#define PIC_WIDTH 256
#define PIC_HEIGHT 240
#define PRERENDER_END 21
#define PIC_END 261

makeDeviceReader(ppu)
makeDeviceWriter(ppu)

uint8_t read(void *myppu, uint16_t address) {
    ppu *_ppu = (ppu *) myppu;
    address &= 0x0007; // get the last 3 bits of the address to determine the register (registers are mirrored)
    switch (address) {
        case 2: // PPUSTATUS
            _ppu->scrollWriteNo = 0; // reset address latch for PPUSCROLL## and PPUADDR
            _ppu->PPUADDRWriteNo = 0;
            return _ppu->PPUSTATUS;
        case 4: // OAMDATA
            return _ppu->oamram[_ppu->OAMADDR];
        case 7: // PPUDATA
            uint8_t data = _ppu->vram[_ppu->PPUADDR];
            _ppu->PPUADDR += (_ppu->PPUCTRL & 0b00000100) == 0 ? 1 : 32; // determine increment from 2nd bit of PPUCTRL
            return data;
    }
    fprintf(stderr, "WARNING: attempted to read from unmapped memory");
    return 0;
}

void write(void *myppu, uint16_t address, uint8_t val) {
    ppu *_ppu = (ppu *) myppu;
    address &= 0x0007;
    switch (address) {
        case 0: // PPUCTRL
            _ppu->PPUCTRL = val;
            break;
        case 1: // PPUMASK
            _ppu->PPUMASK = val;
            break;
        case 3: // OAMADDR
            _ppu->OAMADDR = val;
            break;
        case 4: // OAMDATA
            _ppu->oamram[_ppu->OAMADDR] = val;
            _ppu->OAMADDR++; // increment OAMADDR when writing to OAMDATA
            break;
        case 5: // PPUSCROLL
            // inital value of 0 means X register is written to first
            _ppu->scrollWriteNo ^= 1; // Perform XOR to toggle scrollWriteNo
            if (_ppu->scrollWriteNo) { // write to PPUSCROLLX
                _ppu->PPUSCROLLX = val;
            } else { // write to PPUSCROLLY
                _ppu->PPUSCROLLY = val;
            }
            break;
        case 6: // PPUADDR
            _ppu->PPUADDRWriteNo ^= 1;
            if (_ppu->PPUADDRWriteNo) { // write to higher byte of PPUADDR
                _ppu->PPUADDR = (val << 8) | (_ppu->PPUADDR & 0x00FF);
            } else { // write to lower byte of PPUADDR
                _ppu->PPUADDR = (_ppu->PPUADDR & 0xFF00) | val;
            }
            break;
        case 7: // PPUDATA
            _ppu->vram[_ppu->PPUADDR] = val;
            _ppu->PPUADDR += (_ppu->PPUCTRL & 0b00000100) == 0 ? 1 : 32;
            break;
    }
}

void createPPU(ppu *_ppu) {
    _ppu->PPUCTRL = 0;
    _ppu->PPUMASK = 0;
    _ppu->PPUSTATUS = 0;
    _ppu->OAMADDR = 0;
    _ppu->OAMDATA = 0;
    _ppu->PPUSCROLLX = 0;
    _ppu->PPUSCROLLY = 0;
    _ppu->PPUADDR = 0;
    _ppu->PPUDATA = 0;
    _ppu->OAMDMA = 0;

    _ppu->frameCounter = 0;
    _ppu->frameCol = 0;
    _ppu->frameRow = 0;

    _ppu->scrollWriteNo = 0;
    _ppu->PPUADDRWriteNo = 0;
    _ppu->vramMap[0] = &_ppu->vram[0x0000];
    _ppu->vramMap[1] = &_ppu->vram[0x0000];
    _ppu->vramMap[2] = &_ppu->vram[0x0400];
    _ppu->vramMap[3] = &_ppu->vram[0x0400];
}

void stepPPU(ppu *_ppu) {
    _ppu->frameRow += (_ppu->frameCol++) / LINE_WIDTH;
    _ppu->frameCounter += (_ppu->frameRow) / LINE_COUNT;
    _ppu->frameCol %= LINE_WIDTH;
    _ppu->frameRow %= LINE_COUNT;
}

