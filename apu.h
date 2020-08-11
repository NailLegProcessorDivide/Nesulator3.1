//
// Created by joseph on 30/06/2020.
//

#ifndef NESULATOR_APU_H
#define NESULATOR_APU_H

#include <stdint.h>

struct ppuPulse {
    uint8_t flags1;
    uint8_t flags2;
    uint8_t timer;
    uint8_t counterLoad;
};

struct ppuTriangle {
    uint8_t LinearCounter;
    uint8_t unused;
    uint8_t timer;
    uint8_t counterLoad;
};

struct ppuNoise {
    uint8_t volume;
    uint8_t unused;
    uint8_t period;
    uint8_t counterLoad;
};

struct ppuDMC {
    uint8_t frequency;
    uint8_t loadCounter;
    uint8_t sampleAddress;
    uint8_t sampleLength;
};

typedef struct ppuPulse ppuPulse;
typedef struct ppuTriangle ppuTriangle;
typedef struct ppuNoise ppuNoise;
typedef struct ppuDMC ppuDMC;

struct apuRP2A03 {
    ppuPulse pulse1;
    ppuPulse pulse2;
    ppuTriangle triangle;
    ppuNoise noise;
    ppuDMC  DMC;

    uint8_t status;
    uint8_t frameCounter;
};

typedef struct apuRP2A03 apuRP2A03;

#endif //NESULATOR_APU_H
