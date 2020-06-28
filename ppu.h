//
// Created by Joseph on 14/06/2020.
//

#ifndef NESULATOR_PPU_H
#define NESULATOR_PPU_H

#include "emulatorGlue.h"
#include "window.h"
#include "cpu.h"

struct ppu2A03 {
    uint8_t PPUCTRL;
    uint8_t PPUMASK;
    uint8_t PPUSTATUS;
    uint8_t OAMADDR;
    uint8_t OAMDATA;
    uint8_t PPUSCROLLX;
    uint8_t PPUSCROLLY;
    uint16_t PPUADDR;
    uint8_t PPUDATA;
    uint8_t OAMDMA;

    uint8_t vram[0x800];
    uint8_t oamram[0x100];
    uint8_t *vramMap[4];

    uint8_t colourPalette[16];
    uint8_t screenBuffer[256 * 240];

    uint32_t frameCounter;
    uint16_t frameRow;
    uint16_t frameCol;

    uint8_t scrollWriteNo;
    uint8_t PPUADDRWriteNo;

    device816 *devices;
    size_t deviceCount;

    uint64_t ppuTick;
    nesWindow *window;
};

typedef struct ppu2A03 ppu2A03;

void createPPU(ppu2A03 *);

void stepPPU(ppu2A03 *, mos6502 *);

void createPPUDevice(device816 *, const ppu2A03 *);

void destroyPPU(ppu2A03 *);

makeDeviceAdderDeclaration(ppu2A03)

#endif //NESULATOR_PPU_H
