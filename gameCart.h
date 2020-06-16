//
// Created by Joseph on 16/06/2020.
//

#ifndef NESULATOR_GAMECART_H
#define NESULATOR_GAMECART_H

#include "emulatorGlue.h"

struct nesCart{
    device816 cpuRom;
    device816 ppuRom;
    uint8_t* buffer;
};

typedef struct nesCart nesCart;

void createNesCart(nesCart* cart, const char* fileName);
void destroyNesCart(nesCart* cart);
#endif //NESULATOR_GAMECART_H
