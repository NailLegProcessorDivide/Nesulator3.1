//
// Created by Joseph on 16/06/2020.
//

#include "gameCart.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// macro to not hurt Microsoft's feels too much
#define _CRT_SECURE_NO_WARNINGS 1 // ~~my compiler doesn't care if this is defined or not

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

uint8_t basicReader(void* data, uint16_t addr)
{
    return ((uint8_t*)data)[addr];
}

uint8_t basicMirroredReader(void* data, uint16_t addr)
{
    return ((uint8_t*)data)[addr & 0x3FFF];
}

uint8_t mirroredVRomReader(void* data, uint16_t addr)
{
    return ((uint8_t*)data)[addr];
}

void nullWrite(void* data, uint16_t addr, uint8_t val)
{

}

void createNRom (nesCart* cart, const uint8_t* romData, const nesFileHeader* hData)
{
    cart->cpuRom.data = romData;
    cart->cpuRom.length = 0x8000;
    cart->cpuRom.start = 0x8000;
    cart->cpuRom.writefun = nullWrite;

    cart->ppuRom.data = romData + ROM_PAGE_SIZE * hData->nRomBanks;
    cart->ppuRom.length = 0x2000;
    cart->ppuRom.start = 0;
    cart->ppuRom.readfun = mirroredVRomReader;
    cart->ppuRom.writefun = nullWrite;

    if (hData->nRomBanks == 2){ // 2 banks - full 32K ROM
        cart->cpuRom.readfun = basicReader;
    }
    else { // 1 bank - mirrored 16K ROM
        cart->cpuRom.readfun = basicMirroredReader;
    }
    printf("CREATED CARTRIDGE: mapper type=%i, CPU banks=%i", hData->mapperID, hData->nRomBanks);
    printf(", PRG ROM=%i*16K, CHR ROM=%i*8K\n", hData->nRomBanks, hData->nVRomBanks);
}

int createNesCart(nesCart* cart, const char* fileName) {
    FILE* file = fopen(fileName, "rb"); // read file in binary mode
    if (file==NULL){
        fputs("file not found\n", stderr);
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

    switch(hData.mapperID) {
        case 0: // NROM
            createNRom(cart, gameData, &hData);
            break;
        // TODO: MORE MAPPERS!! :D
        default:
            free(gameData);
            fputs("ERROR: no matching format for the mapper", stderr);
            return -1;
    }
    return 0;
}

void destroyNesCart(nesCart* cart) {
    free(cart->cpuRom.data);
    fputs("DELETED CARTRIDGE", stdout);
}

