//
// Created by joseph on 30/06/2020.
//

#ifndef NESULATOR_APU_H
#define NESULATOR_APU_H

#include <stdint.h>
#include "cpu.h"
#include "ppu.h"
#include "emulatorGlue.h"

struct apuPulse {
    uint8_t flags1;
    uint8_t flags2;
    uint8_t timer;
    uint8_t counterLoad;
};

struct apuTriangle {
    uint8_t linearCounter;
    uint8_t unused;
    uint8_t timer;
    uint8_t counterLoad;
};

struct apuNoise {
    uint8_t volume;
    uint8_t unused;
    uint8_t period;
    uint8_t counterLoad;
};

struct apuDMC {
    uint8_t frequency;
    uint8_t loadCounter;
    uint8_t sampleAddress;
    uint8_t sampleLength;
};

typedef struct apuPulse apuPulse;
typedef struct apuTriangle apuTriangle;
typedef struct apuNoise apuNoise;
typedef struct apuDMC apuDMC;

struct apuRP2A03 {
    apuPulse pulse1;
    apuPulse pulse2;
    apuTriangle triangle;
    apuNoise noise;
    apuDMC dmc;

    uint8_t status;
    uint8_t frameCounter;

    //sins
    ppu2A03* ppu;
    mos6502 * cpu;
};

typedef struct apuRP2A03 apuRP2A03;

void tickAPURP2A03(apuRP2A03 *_apu);
void createAPURP2A03(apuRP2A03 *_apu, ppu2A03 *_ppu, mos6502 *_cpu);

void createDMADevice(device816 *dev, apuRP2A03 *_apu);
void createAPUDevice(device816 *dev, apuRP2A03 *_apu);


#endif //NESULATOR_APU_H
