//
// Created by Joseph on 14/06/2020.
//

#ifndef NESULATOR_PPU_H
#define NESULATOR_PPU_H

#include "emulatorGlue.h"
#include "window.h"
#include "cpu.h"

struct spriteData {
    uint8_t xCount;
    uint8_t patern0;
    uint8_t patern1;
    uint8_t attrib;
};

typedef struct spriteData spriteData;

struct ppu2A03 {
    uint8_t PPUCTRL;
    uint8_t PPUMASK;
    uint8_t PPUSTATUS;
    uint8_t OAMADDR;
    uint8_t OAMDATA;
    uint8_t PPUDATA;
    uint8_t OAMDMA;

    uint8_t vram[0x800];
    uint8_t oamram[0x100];
    uint8_t oamram2[32];
    uint8_t *vramMap[4];

    uint8_t colourPalette[32];
    uint8_t screenBuffer[256 * 240];

    uint64_t frameCounter;
    uint_fast16_t frameRow;
    uint_fast16_t frameCol;

    device816 *devices;
    size_t deviceCount;

    uint64_t ppuTick;
    nesWindow *window;

    uint16_t AB0;
    uint16_t AB1;

    uint32_t attribVal;

    uint8_t attrib0;
    uint8_t attrib1;

    uint16_t vramAddr;
    uint16_t tvramAddr;
    uint_fast8_t finexScroll;
    bool writeToggle;

    bool sp0;

    int dummyCount;

    spriteData spLatches[8];
};

typedef struct ppu2A03 ppu2A03;

void createPPU(ppu2A03 *);

bool stepPPU(ppu2A03 *, mos6502 *);

void createPPUDevice(device816 *, const ppu2A03 *);

void destroyPPU(ppu2A03 *);

makeDeviceAdderDeclaration(ppu2A03)

#endif //NESULATOR_PPU_H
