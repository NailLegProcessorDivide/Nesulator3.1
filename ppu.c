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

uint8_t ppu2A03read(void *myppu, uint16_t address) {
    ppu2A03 *_ppu = (ppu2A03 *) myppu;
    address &= 0x0007; // get the last 3 bits of the address to determine the register (registers are mirrored)
    switch (address) {
        case 2: // PPUSTATUS
            _ppu->scrollWriteNo = 0; // reset address latch for PPUSCROLL## and PPUADDR
            _ppu->PPUADDRWriteNo = 0;
            uint8_t val = _ppu->PPUSTATUS;
            _ppu->PPUSTATUS &= 0x7F;
            return val;
        case 4: // OAMDATA
            return _ppu->oamram[_ppu->OAMADDR];
        case 7: // PPUDATA
            _ppu->PPUADDR += (_ppu->PPUCTRL & 0b00000100) == 0 ? 1 : 32; // determine increment from 2nd bit of PPUCTRL
            return _ppu->vram[_ppu->PPUADDR];
    }
    fprintf(stdout, "WARNING: attempted to read from unmapped memory (address 0x%X)\n", address);
    return 0;
}

void ppu2A03write(void *myppu, uint16_t address, uint8_t val) {
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

void writePalate(ppu2A03* _ppu, uint16_t address, uint8_t value) {
    uint8_t add = address%32;
    if(add&3)
        _ppu->colourPalette[add] = value;
    else
        _ppu->colourPalette[add&0x0F] = value;
}

uint8_t readPalate(ppu2A03 *_ppu, uint16_t address) {
    uint8_t add = address%32;
    if(add&3)
        return _ppu->colourPalette[add];
    else
        return _ppu->colourPalette[add&0x0F];
}

void makePalateDevice(ppu2A03* _ppu, device816* dev) {
    dev->start = 0x3F00;
    dev->length = 0x0100;
    dev->writefun = writePalate;
    dev->readfun = readPalate;
    dev->data = (void*)_ppu;
}

void createPPUDevice(device816 *dev, const ppu2A03 *_ppu) {
    dev->length = 0x2000;
    dev->data = (void*)_ppu;
    dev->readfun = ppu2A03read;
    dev->writefun = ppu2A03write;
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

    if (createNesWindow(&_ppu->window)) {
        printf("issue creating window\n");
    }
}

void destroyPPU(ppu2A03 *_ppu) {
    deleteNesWindow(_ppu->window);
}

void renderLine(ppu2A03 *_ppu, uint8_t *lineOutBuffer, uint8_t renderLineNo) {
    uint16_t realLineNo = (renderLineNo + (_ppu->PPUCTRL & 2) * 120 + _ppu->PPUSCROLLY); // &2*120 + 240 if bit 2 is set
    uint8_t yTile = (realLineNo >> 3) % 30;
    uint16_t nameTableLineAddr = ((realLineNo >> 3) % 30) * 32 + (((realLineNo >> 3) / 30) & 1) * 0x800;

    size_t dataCounter = 0;
    uint8_t spriteData[32];
    for (int i = 0; i < 64 && dataCounter != 32; ++i) {
        if ((uint8_t)(-_ppu->oamram[i*4] - 1 + renderLineNo) < 8u) {
            ((uint32_t*)spriteData)[dataCounter++] = ((uint32_t*)_ppu->oamram)[i];
        }
    }

    for (int xpix = (_ppu->PPUSCROLLX & 7) - 8; xpix < 256; xpix += 8) {

        uint16_t realColNo = (xpix + ((_ppu->PPUCTRL & 1) << 8) + _ppu->PPUSCROLLX);
        uint8_t xTile = (realColNo >> 3) % 32;
        uint16_t xAddrOffset =
                (realColNo >> 3) + ((realColNo >> 8) & 1) * 0x400; // (/8 = >>3) then (/32 = >>5) so >> 8 is both

        uint16_t nameTableAddress = 0x2000 + nameTableLineAddr + xAddrOffset;
        uint8_t ntval = read_ppu2A03(_ppu, nameTableAddress);

        uint16_t attribAddress = (nameTableAddress & 0x2fC0) + (yTile >> 2) * 8 + (xTile >> 2);
        uint8_t ppuAttribVal = read_ppu2A03(_ppu, attribAddress);

        uint8_t colPal = (ppuAttribVal >> (((yTile << 1) & 4) + ((xTile) & 2))) & 3;

        uint16_t patternTableAddress = (ntval << 4) + (realLineNo & 7);
        uint8_t ptByteLeft = read_ppu2A03(_ppu, patternTableAddress);
        uint16_t ptByteRight = read_ppu2A03(_ppu, patternTableAddress + 8) << 1;

        for (int tx = 0; tx < 8; ++tx) {
            uint8_t pixCol;
            uint8_t colInd = ((ptByteLeft >> tx) & 1) | ((ptByteRight >> tx) & 1);
            if (colInd) {
                pixCol = _ppu->colourPalette[colPal * 4 + colInd];
            } else {
                pixCol = _ppu->colourPalette[0];
            }

            if (xpix + tx >= 0 || xpix + tx < 256) {
                uint8_t spriteCol;
                for (int i = 0; i < 8; ++i) {
                    uint8_t pixPos = (xpix + tx) - spriteData[i * 4 + 3];
                    if (pixPos < 8u) {
                        uint8_t spptByteLeft = read_ppu2A03(_ppu, patternTableAddress);
                        uint16_t spptByteRight = read_ppu2A03(_ppu, patternTableAddress + 8) << 1;

                        uint8_t spriteColInd = spriteData[i * 4 + 2] & 3;

                        uint8_t spriteInd = ((ptByteLeft >> tx) & 1) | ((ptByteRight >> tx) & 1);
                        if (colInd) {
                            spriteCol = _ppu->colourPalette[16 + spriteColInd * 4 + spriteInd];
                        } else {
                            spriteCol = _ppu->colourPalette[16];
                        }

                        //do the pixel
                        break;
                    }
                }
            }
            lineOutBuffer[xpix + tx] = pixCol;
        }
    }
}

void stepPPU(ppu2A03 *_ppu, mos6502 *_cpu) {
    ++_ppu->ppuTick;
    //printf("ppu tick: %u\n", _ppu->ppuTick);
    if (_ppu->ppuTick <= 29658) return;//wait a few cycles before starting the ppu
    //printf("ppuLive\n");
    _ppu->frameRow += (++_ppu->frameCol) / LINE_WIDTH;
    _ppu->frameCounter += (_ppu->frameRow) / LINE_COUNT;
    _ppu->frameCol %= LINE_WIDTH;
    _ppu->frameRow %= LINE_COUNT;
    if (_ppu->frameRow == 0) {
        _ppu->PPUSTATUS &= 0xBF;
    }
    if (_ppu->frameCol == 1 && _ppu->frameRow < 240) {
        printf("draw line %u frame %u\n", _ppu->frameRow, _ppu->frameCounter);
        renderLine(_ppu, &_ppu->screenBuffer[_ppu->frameRow * 256], _ppu->frameRow);
    }
    if (_ppu->frameRow == 240) {
        if (_ppu->frameCol == 1) {
            printf("setState\n");
            _ppu->PPUSTATUS |= 0x80;
            drawNesFrame(_ppu->window, _ppu->screenBuffer);
            if (_ppu->PPUCTRL & 0x80) {
                triggerNMI(_cpu);
            }
        }
    }
    if (_ppu->frameRow == 260) {
        if(_ppu->frameCol == 0) {
            _ppu->PPUSTATUS &= 0x7F;
        }
    }
}

