//
// Created by Joseph on 16/06/2020.
//

#ifndef NESULATOR_GAMECART_H
#define NESULATOR_GAMECART_H

#include "emulatorGlue.h"

struct nesCart {
	device816 prgRom; // CPU ROM
	device816 chrRom; // PPU ROM

	const uint8_t* prgBanks[32]; // 32 * 1K banks of ROM that CPU can see
	const uint8_t* chrBanks[4]; // 4 * 1K banks of ROM that PPU can see

	//void (*destruct)(nesCart* cart);
};

typedef struct nesCart nesCart;

int createNesCart(nesCart* cart, const char* fileName);
void destroyNesCart(nesCart* cart);
#endif //NESULATOR_GAMECART_H
