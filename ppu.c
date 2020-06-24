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

makeDeviceReader(ppu2A03)
makeDeviceWriter(ppu2A03)
makeDeviceAdder(ppu2A03)

uint8_t read(void *myppu, uint16_t address) {
    ppu2A03 *_ppu = (ppu2A03 *) myppu;
    address &= 0x0007; // get the last 3 bits of the address to determine the register (registers are mirrored)
    switch (address) {
        case 2: // PPUSTATUS
            _ppu->scrollWriteNo = 0; // reset address latch for PPUSCROLL## and PPUADDR
            _ppu->PPUADDRWriteNo = 0;
            return _ppu->PPUSTATUS;
        case 4: // OAMDATA
            return _ppu->oamram[_ppu->OAMADDR];
        case 7: // PPUDATA
            _ppu->PPUADDR += (_ppu->PPUCTRL & 0b00000100) == 0 ? 1 : 32; // determine increment from 2nd bit of PPUCTRL
            return _ppu->vram[_ppu->PPUADDR];
    }
    fprintf(stderr, "WARNING: attempted to read from unmapped memory");
    return 0;
}

void write(void *myppu, uint16_t address, uint8_t val) {
    ppu2A03 *_ppu = (ppu2A03 *) myppu;
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

void createPPUDevice(device816* dev, ppu2A03* _ppu) {
    dev->length = 0x2000;
    dev->data = _ppu;
    dev->readfun = read;
    dev->writefun = write;
    dev->start = 0x2000;
}

void createPPU(ppu2A03 *_ppu) {
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

    _ppu->ppuTick = 0;

    _ppu->devices = nullptr;
    _ppu->deviceCount = 0;
}

void renderLine(ppu2A03* _ppu, uint8_t* lineOutBuffer, uint8_t renderLineNo) {
    uint16_t realLineNo = (renderLineNo + (_ppu->PPUCTRL&2)*120 + _ppu->PPUSCROLLY); // &2*120 + 240 if bit 2 is set
    uint8_t yTile = (realLineNo>>3)%30;
    uint16_t nameTableLineAddr = ((realLineNo>>3)%30)*32 + (((realLineNo>>3)/30)&1)*0x800;

    for(int xpix = (_ppu->PPUSCROLLX&7) - 8; xpix < 256; xpix += 8) {
        uint16_t realColNo = (xpix + ((_ppu->PPUCTRL&1)<<8) + _ppu->PPUSCROLLX);
        uint8_t xTile = (realColNo>>3)%32;
        uint16_t xAddrOffset = (realColNo>>3) + ((realColNo>>8) & 1) * 0x400;// (/8 = >>3) then (/32 = >>5) so >> 8 is both

        uint16_t nameTableAddress = 0x2000 + nameTableLineAddr + xAddrOffset;
        uint8_t ntval = read_ppu2A03(_ppu, nameTableAddress);

        uint16_t attribAddress =  (nameTableAddress&0x2fC0) + (yTile>>2)*8 + (xTile>>2);
        uint8_t ppuAttribVal = read_ppu2A03(_ppu, attribAddress);

        uint8_t colPal = (ppuAttribVal>>(((yTile<<1)&4) + ((xTile)&2)))&3;

        uint16_t patternTableAddress = (ntval<<4) + (realLineNo&7);
        uint8_t ptByteLeft = read_ppu2A03(_ppu, patternTableAddress);
        uint16_t ptByteRight = read_ppu2A03(_ppu, patternTableAddress+8)<<1;

        for(int tx = 0; tx < 8; ++tx) {
            uint8_t pixCol;
            uint8_t colInd = ((ptByteLeft>>tx)&1) | ((ptByteRight>>tx)&1);
            if(colInd) {
                pixCol = _ppu->colourPalette[colPal*4 + colInd];
            }
            else {
                pixCol = _ppu->colourPalette[0];
            }

            if(xpix + tx >= 0 || xpix + tx < 256) {
                lineOutBuffer[xpix+tx] = pixCol;
            }
        }
    }
}

void stepPPU(ppu2A03 *_ppu) {
    uint8_t nothing[256];
    ++_ppu->ppuTick;

    if(_ppu->ppuTick <= 29658) return;//wait a few cycles before starting the ppu

    _ppu->frameRow += (_ppu->frameCol++) / LINE_WIDTH;
    _ppu->frameCounter += (_ppu->frameRow) / LINE_COUNT;
    _ppu->frameCol %= LINE_WIDTH;
    _ppu->frameRow %= LINE_COUNT;

    if(_ppu->frameCol == 1 && _ppu->frameRow < 240) {
        renderLine(_ppu, nothing, _ppu->frameRow);
    }
}

