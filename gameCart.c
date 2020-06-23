//
// Created by Joseph on 16/06/2020.
//

#include "gameCart.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// macro to not hurt Microsoft's feels too much
#define _CRT_SECURE_NO_WARNINGS 1 // ~~my compiler doesn't care if this is defined or not

#define BANK_SIZE 0x0400
#define ROM_PAGE_SIZE 0x4000
#define VROM_PAGE_SIZE 0x2000

#define BIT(x) (1 << x)

struct nesFileHeader {
	uint8_t mapperID;
	uint8_t verticalMirror; // 1 = vertical; 0 = horizontal;
	uint8_t hasRam;
	uint8_t hasTrainer;
	uint8_t ignoreMirror; // add extra VRAM for all 4 screens
	uint8_t nRomBanks;
	uint8_t nVRomBanks;
};

typedef struct nesFileHeader nesFileHeader;

uint8_t basicReader(void* data, uint16_t addr) {
    //printf("nrom %016X - ", &((uint8_t**)data)[addr >> 10][addr & 0x03FF]);
    //printf("nrom read %i %i\n", addr >> 10, addr & 0x03FF);
	return ((uint8_t**)data)[addr >> 10][addr & 0x03FF];//read from address/1024
}

uint8_t mirroredVRomReader(void* data, uint16_t addr) {
	return ((uint8_t*)data)[addr];
}

void nullWrite(void* data, uint16_t addr, uint8_t val) {

}

void createNRom(nesCart* cart, const uint8_t* romData, const nesFileHeader* hData) {
	//printf("nrom %016X\n", romData);
	for (int i = 0; i < 32; i++) {
		cart->prgBanks[i] = &romData[BANK_SIZE * (i % (16 * hData->nRomBanks))];
		//printf("nrom %04X\n", BANK_SIZE * (i % (16 * hData->nRomBanks)));
	}

    for (int j = 0; j < 4; j++) {
        cart->chrBanks[j] = &romData[ROM_PAGE_SIZE * hData->nRomBanks + BANK_SIZE * j];
    }
	cart->prgRom.data = &(cart->prgBanks);
    cart->prgRom.start = 0x8000;
	cart->prgRom.length = 0x8000;
    cart->prgRom.readfun = basicReader;
	cart->prgRom.writefun = nullWrite;

	cart->chrRom.data = &(cart->chrBanks);
    cart->chrRom.start = 0;
	cart->chrRom.length = 0x2000;
	cart->chrRom.readfun = mirroredVRomReader;
	cart->chrRom.writefun = nullWrite;
}

void createMMC3(nesCart* cart, const uint8_t* romData, const nesFileHeader* hData) {


	cart->prgRom.data = &(cart->prgBanks);
	cart->prgRom.start = 0x8000;
	cart->prgRom.length = 0x8000;
	cart->prgRom.readfun = basicReader;
	cart->prgRom.writefun = nullWrite;

	cart->chrRom.data = &(cart->chrBanks);
	cart->chrRom.start = 0;
	cart->chrRom.length = 0x2000;
	cart->chrRom.readfun = mirroredVRomReader;
	cart->chrRom.writefun = nullWrite;
}

int createNesCart(nesCart* cart, const char* fileName) {
	FILE* file = fopen(fileName, "rb"); // read file in binary mode
	if (file == NULL) {
		fputs("ERROR: file not found\n", stderr);
		return -1;
	}
	uint8_t nesStr[4];

	fread(nesStr, 1, 4, file);
	if (memcmp(nesStr, "NES", 3)) { // first 3 bytes must start with NES for it to be a valid file
		fputs("ERROR: file isn't NES format", stderr);
		fclose(file); // close file
		return -1;
	}

	nesFileHeader hData; // header data
	uint8_t flags6, flags7; // bytes containing flags about file sub-format
	//printf("c %i, p %i, %i\n", headerData.nRomBanks, headerData.nVRomBanks, nesStr[3]);
	fread(&hData.nRomBanks, 1, 1, file); // byte 4 (size of PRG ROM in 16KB units)
	fread(&hData.nVRomBanks, 1, 1, file); // byte 5 (size of CHR ROM in 8KB units)

	fread(&flags6, sizeof(uint8_t), 1, file); // byte 6 (flags for mapper, mirroring, battery, trainer)
	fread(&flags7, sizeof(uint8_t), 1, file); // byte 7 (flags for mapper, VS/Playchoice, NES 2.0)

	// high nibble of flags6 = low nibble of mapper ID
	// high nibble of flags7 = high nibble of mapper ID
	hData.mapperID = (flags7 & 0xF0) | (flags6 >> 4);

	hData.verticalMirror = flags6 & BIT(0);
	hData.hasRam = flags6 & BIT(1);
	hData.hasTrainer = flags6 & BIT(2);
	hData.ignoreMirror = flags6 & BIT(3);

	// TODO: read low nibble of flags7 to get data about NES 2.0, PlayChoice-10, VSUnisystem
	//  If NES 2.0 is enabled, change the below code to use flags 8-15

	{ // ignore bytes 8-15 as they should be filled with zero's if using iNES format
		uint8_t ignore[8];
		fread(ignore, sizeof(uint8_t), 8, file);
	}

	if (hData.hasTrainer) {
		uint8_t ignore[512];
		fread(ignore, sizeof(uint8_t), 512, file);
	}

	size_t fileDataSize = ROM_PAGE_SIZE * hData.nRomBanks + VROM_PAGE_SIZE * hData.nVRomBanks;
	uint8_t* gameData = malloc(sizeof(uint8_t) * fileDataSize);
	fread(gameData, sizeof(uint8_t), fileDataSize, file);
	fclose(file); // close file

	switch (hData.mapperID) {
	case 0: // NROM
		createNRom(cart, gameData, &hData);
		break;
	case 4: // MMC3
		createMMC3(cart, gameData, &hData);
		break;
		// TODO: MORE MAPPERS!! :D
	default:
		free(gameData);
		fputs("ERROR: no matching format for the mapper", stderr);
		return -1;
	}
	printf("CREATED CARTRIDGE: mapper type=%i, CPU banks=%i", hData.mapperID, hData.nRomBanks);
	printf(", PRG ROM=%i*16K, CHR ROM=%i*8K\n", hData.nRomBanks, hData.nVRomBanks);
	return 0;
}

void destroyNesCart(nesCart* cart) {
	free(cart->prgRom.data);
	fputs("DELETED CARTRIDGE", stdout);
}



