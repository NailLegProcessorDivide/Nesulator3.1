#include "ppu.h"
#include "emulatorGlue.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

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
    uint8_t rval = 0;
    switch (address) {
        case 2: // PPUSTATUS
            _ppu->writeToggle = false;
            uint8_t val = _ppu->PPUSTATUS;
            _ppu->PPUSTATUS &= 0x7F;
            rval =  val;
        case 4: // OAMDATA
            rval =  _ppu->oamram[_ppu->OAMADDR];
        case 7: // PPUDATA
            _ppu->vramAddr += (_ppu->PPUCTRL & 0b00000100) == 0 ? 1 : 32; // determine increment from 2nd bit of PPUCTRL
            rval = _ppu->vram[_ppu->vramAddr & 0x3FFF];
    }
    //printf("read ppureg 0x%04X = 0x%02X\n", address, rval);
    //fprintf(stdout, "WARNING: attempted to read from unmapped memory (address 0x%X)\n", address);
    return rval;
}

void ppu2A03write(void *myppu, uint16_t address, uint8_t val) {
    //printf("write ppureg 0x%04X = 0x%02X\n", address, val);
    ppu2A03 *_ppu = (ppu2A03 *) myppu;
    address &= 0x0007;
    switch (address) {
        case 0: // PPUCTRL
            _ppu->PPUCTRL = val;
            _ppu->tvramAddr = (_ppu->tvramAddr&~(0b11<<10)) | (val&0b11)<<10;//http://wiki.nesdev.com/w/index.php/PPU_scrolling
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
            if(_ppu->writeToggle) {//1
                _ppu->tvramAddr &= 0x0C1F;
                _ppu->tvramAddr |= ((val&0x07)<<12) | ((val&0xF4) << 2);
                _ppu->writeToggle = false;
            }
            else {//0
                _ppu->finexScroll = val&0x07;
                _ppu->tvramAddr &= 0xFFE0;
                _ppu->tvramAddr |= (val&0xF8 >> 3);
                _ppu->writeToggle = true;
            }
            break;
        case 6: //
            if(_ppu->writeToggle) {//1
                _ppu->tvramAddr &= 0x00FF;
                _ppu->tvramAddr |= (val&0x7F)<<8;
                _ppu->writeToggle = false;
            }
            else {//0
                _ppu->finexScroll = val&0x07;
                _ppu->tvramAddr &= 0xFF00;
                _ppu->tvramAddr |= val;
                _ppu->vramAddr = _ppu->tvramAddr;
                _ppu->writeToggle = true;
            }
            break;
        case 7: // PPUDATA
            write_ppu2A03(_ppu, _ppu->vramAddr, val);
            _ppu->vramAddr += (_ppu->PPUCTRL & 0b00000100) == 0 ? 1 : 32;
            break;
    }
}

void writeRAMppu(void* mem, uint16_t address, uint8_t value){
    ((uint8_t**)mem)[((address>>10)&2)][address & 0x3FF] = value;
}
uint8_t readRAMppu(void* mem, uint16_t address){
    return ((uint8_t*)mem)[address];
}

void writePalate(void* ppu, uint16_t address, uint8_t value) {
    ppu2A03* _ppu = ppu;
    uint8_t add = address%32;
    if(add&3)
        _ppu->colourPalette[add] = value;
    else
        _ppu->colourPalette[add&0x0F] = value;
}

uint8_t readPalate(void *ppu, uint16_t address) {
    ppu2A03* _ppu = ppu;
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

void makeNameTableDevice(ppu2A03 *_ppu,device816 *dev) {
    dev->start = 0x2000;
    dev->length = 0x1EFF;
    dev->writefun = writeRAMppu;
    dev->readfun = readRAMppu;
    dev->data = (void*)_ppu->vramMap;
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
    _ppu->PPUDATA = 0;
    _ppu->OAMDMA = 0;

    _ppu->frameCounter = 0;
    _ppu->frameCol = 0;
    _ppu->frameRow = 0;

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

    device816 palletteDevice;
    makePalateDevice(_ppu, &palletteDevice);

    device816 NTDevice;
    makeNameTableDevice(_ppu, &NTDevice);

    if(!add_ppu2A03_device(_ppu, &palletteDevice)) {
        printf("not added pallete device");
    }
    if(!add_ppu2A03_device(_ppu, &NTDevice)) {
        printf("not added pallete device");
    }
}

void destroyPPU(ppu2A03 *_ppu) {
    deleteNesWindow(_ppu->window);
}

void cxInc(ppu2A03 *_ppu) {
    if((_ppu->vramAddr & 0x1F) == 0x1F) {
        _ppu->vramAddr &= ~0x001F;
        _ppu->vramAddr ^= 0x0400;
    }
    else {
        ++_ppu->vramAddr;
    }
}

void yInc(ppu2A03 *_ppu) {
    if (_ppu->vramAddr < 0x7000) {
        _ppu->vramAddr += 0x1000;
    }
    else {
        _ppu->vramAddr &= 0x8FFF;
        if ((_ppu->vramAddr & 0x03E0) == 0x3A0) {//29 col needs to wrap past
            _ppu->vramAddr &= ~0x03E0;
            _ppu->vramAddr ^= 0x0800;
        }
        else if ((_ppu->vramAddr & 0x03E0) == 0x3E0) {
            _ppu->vramAddr &= ~0x03E0;
        }
        else {
            _ppu->vramAddr += 0x20;
        }

    }
}

uint16_t getTileAddr (ppu2A03 *_ppu){
    return 0x2000 | (_ppu->vramAddr & 0x0FFF);
}

uint16_t getAttribAddr (ppu2A03 *_ppu){
    return 0x23C0 | (_ppu->vramAddr & 0x0C00) |
        ((_ppu->vramAddr >> 4) & 0x38) | ((_ppu->vramAddr >> 2) & 0x07);
}

uint16_t getPatturnAddr(ppu2A03 *_ppu, uint8_t tileNo){
    return (tileNo<<4) + (_ppu->vramAddr>>12);
}

uint8_t renderEnable(ppu2A03 *_ppu) {
    return _ppu->PPUMASK&0x18;
}
uint8_t renderBGEnable(ppu2A03 *_ppu) {
    return _ppu->PPUMASK&0x8;
}
uint8_t renderSPEnable(ppu2A03 *_ppu) {
    return _ppu->PPUMASK&0x10;
}
void setSPOverFlag(ppu2A03 *_ppu) {
    _ppu->PPUSTATUS |= 0x20;
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
    if (renderEnable(_ppu)) {
        if (_ppu->frameRow < 240) {
            if (_ppu->frameCol == 64) {
                memset(_ppu->oamram2, 0xff, 64);
            } else if (_ppu->frameCol == 256) {
                uint_fast8_t spfound = 0;
                uint_fast8_t moffset = 0;
                for (uint_fast8_t i = 0; i < 64; ++i) {
                    if(spfound < 8 ) {
                        if ((uint32_t)(_ppu->oamram[i<<2] - _ppu->frameRow) < 8) {
                            _ppu->oamram2[spfound << 2] = _ppu->oamram[i << 2];
                            _ppu->oamram2[(spfound << 2) + 1] = _ppu->oamram[(i << 2) + 1];
                            _ppu->oamram2[(spfound << 2) + 2] = _ppu->oamram[(i << 2) + 2];
                            _ppu->oamram2[(spfound << 2) + 3] = _ppu->oamram[(i << 2) + 3];
                            ++spfound;
                        }
                    }
                    else if ((uint32_t)(_ppu->oamram[(i << 2) + moffset] - _ppu->frameRow) < 8) {
                        setSPOverFlag(_ppu);
                    }
                    else {
                        ++moffset;
                        i += (moffset/4);
                        moffset %= 4;
                    }
                }
                for (uint_fast8_t i = 0; i < 8; ++i) {
                    uint32_t yOffset = _ppu->oamram2[i << 2] - _ppu->frameRow;
                    if (yOffset < 8u) {
                        uint_fast16_t tileAddr = ((_ppu->PPUCTRL&8)<<9) + (_ppu->oamram2[(i << 2) + 1]<<4) + yOffset;
                        _ppu->spLatches[i].patern0 = ppu2A03read(_ppu, tileAddr);
                        _ppu->spLatches[i].patern1 = ppu2A03read(_ppu, tileAddr+8);
                        _ppu->spLatches[i].attrib = _ppu->oamram2[(i << 2) + 2];
                        _ppu->spLatches[i].xCount = _ppu->oamram2[(i << 2) + 3];
                    }
                    else {
                        _ppu->spLatches[i].patern0 = 0;
                        _ppu->spLatches[i].patern1 = 0;
                        _ppu->spLatches[i].attrib = 0;
                        _ppu->spLatches[i].xCount = 0;
                    }
                }
            }

            uint8_t colPal = 0;
            uint8_t colVal = 0;
            uint8_t spcol = 0;
            uint8_t spInf;
            if (_ppu->frameCol < 256) {
                if (renderSPEnable(_ppu)) {
                    for (int i = 0; i < 8; ++i) {
                        if (_ppu->spLatches[i].xCount != 0) {
                            _ppu->spLatches[i].xCount = 0;
                        } else {
                            if (spcol == 0) {
                                spcol = ((_ppu->spLatches[i].patern0 & 1) << 1) + (_ppu->spLatches[i].patern1 & 1);
                                spInf = _ppu->spLatches[i].attrib;
                            }
                            _ppu->spLatches[i].patern0 <<= 1;
                            _ppu->spLatches[i].patern1 <<= 1;
                        }
                    }
                }
                if (renderBGEnable(_ppu)) {
                    _ppu->AB0 <<= 1;
                    _ppu->AB1 <<= 1;

                    uint8_t patval = ((_ppu->vramAddr >> 4) & 4) | ((_ppu->vramAddr) & 2);//2 * colour index

                    _ppu->attrib0 = (_ppu->attrib0 << 1) + ((_ppu->attribval >> patval) & 1);
                    _ppu->attrib1 = (_ppu->attrib1 << 1) + ((_ppu->attribval >> (patval + 1)) & 1);

                    colPal = ((_ppu->attrib0 >> _ppu->finexScroll) & 1) |
                             (((_ppu->attrib1 >> (_ppu->finexScroll)) << 1) & 2);
                    colVal = ((_ppu->AB0 >> (8 + _ppu->finexScroll)) & 1) |
                             ((_ppu->AB1 >> (7 + _ppu->finexScroll)) & 2);



                }
                uint8_t fCol = 0;
                if ((spInf & 0x20) != 0) { //bg->sp
                    fCol = spcol + ((spInf&3) << 2) + 0x10;
                }
                fCol = spcol + ((spInf&3) << 2) + 0x10;
                if ((spInf & 0x20) == 0){ //sp->bg
                    fCol = spcol + ((spInf&3) << 2) + 0x10;
                }
                _ppu->screenBuffer[_ppu->frameRow * 256 + _ppu->frameCol] = read_ppu2A03(_ppu, 0x3F00 + fCol);
            }
            if (renderBGEnable(_ppu)) {
                if (_ppu->frameCol == 256) {
                    yInc(_ppu);
                }
                if ((_ppu->frameCol & 7) == 1 && _ppu->frameCol > 1 && _ppu->frameCol < 258) {//load all at once cause easier

                    uint8_t nt = read_ppu2A03(_ppu, getTileAddr(_ppu));
                    _ppu->attribval = read_ppu2A03(_ppu, getAttribAddr(_ppu));
                    uint16_t pAddr = getPatturnAddr(_ppu, nt);
                    _ppu->AB0 |= read_ppu2A03(_ppu, pAddr);
                    _ppu->AB1 |= read_ppu2A03(_ppu, pAddr + 8);
                }
            }

        }
    }
    if (_ppu->frameRow == 240) {
        if (_ppu->frameCol == 1) {
            //printf("setState\n");
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

