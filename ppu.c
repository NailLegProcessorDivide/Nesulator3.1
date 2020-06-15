#include "ppu.h"

#include <stdlib.h>

#define LINEWIDTH 341
#define LINECOUNT 262
#define PICTUREWIDTH 256
#define PICTUREHEIGHT 240
#define PRERENDEREND 21
#define PICTUREEND 261

uint8_t read(void *myppu, uint16_t address) {
    ppu *_ppu = (ppu *) myppu;
    address = address & 7;
    if (address == 2) {
        _ppu->scrollWriteNo = 0;
        return _ppu->PPUSTATUS;
    } else if (address == 4) {
        return _ppu->oamram[_ppu->PPUADDR];
    }
}

void write(void *myppu, uint16_t address, uint8_t val) {
    ppu *_ppu = (ppu *) myppu;
    address = address & 7;
    switch (address) {
        case 0:
            _ppu->PPUCTRL = val;
            break;
        case 1:
            _ppu->PPUMASK = val;
            break;
        case 3:
            _ppu->PPUADDR = val;
            break;
        case 4:
            _ppu->oamram[_ppu->PPUADDR] = val;
            break;
        case 5:
            _ppu->scrollWriteNo ^= 1;
            //if operates based on the initial pre xor value of scrollWriteNo 0->X 1->Y
            if (_ppu->scrollWriteNo) {
                _ppu->PPUSCROLLX = val;
            } else {
                _ppu->PPUSCROLLY = val;
            }
            break;
        case 6:
            _ppu->PPUADDRWriteNo ^= 1;
            if (_ppu->PPUADDRWriteNo) {
                _ppu->PPUADDR = (val << 8) | (_ppu->PPUADDR & 0xFF);
            } else {
                _ppu->PPUSCROLLY = (_ppu->PPUADDR & 0xFF00) | val;
            }
            break;
        case 7:

            break;
    }
}

void createPPU(ppu *_ppu) {
    _ppu->OAMADDR = 0;
    _ppu->OAMDATA = 0;
    _ppu->OAMDMA = 0;
    _ppu->oamram = (uint8_t *) malloc(sizeof(uint8_t) * 0x200);
    _ppu->PPUADDR = 0;
    _ppu->PPUCTRL = 0;
    _ppu->PPUDATA = 0;
    _ppu->PPUMASK = 0;
    _ppu->PPUSCROLLX = 0;
    _ppu->PPUSCROLLY = 0;
    _ppu->PPUSTATUS = 0xA0;
    _ppu->frameCounter = 0;
    _ppu->frameCol = 0;
    _ppu->frameRow = 0;
    _ppu->scrollWriteNo = 0;
    _ppu->PPUADDRWriteNo = 0;
}

void stepPPU(ppu *_ppu) {
    _ppu->frameRow += (_ppu->frameCol++) / LINEWIDTH;
    _ppu->frameCounter += (_ppu->frameRow) / LINECOUNT;
    _ppu->frameCol %= LINEWIDTH;
    _ppu->frameRow %= LINECOUNT;
}

