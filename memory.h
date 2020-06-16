//
// Created by Joseph on 14/06/2020.
//

#ifndef NESULATOR_MEMORY_H
#define NESULATOR_MEMORY_H

#include "emulatorGlue.h"

bool createRamDevice816(device816*, uint16_t, uint16_t);
void destroyRamDevice816(device816*);

bool createRomDevice816(device816*, uint16_t, uint16_t);
void destroyRomDevice816(device816*);

void clearMem(device816* dev);
#endif //NESULATOR_MEMORY_H
