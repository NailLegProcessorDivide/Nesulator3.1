//
// Created by Joseph on 16/06/2020.
//

#include "gameCart.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//macro to not hurt Microsoft's feels too much
#define _CRT_SECURE_NO_WARNINGS 1

#define ROM_PAGE_SIZE 0x4000
#define VROM_PAGE_SIZE 0x2000

struct nesFileHeader {
    uint8_t mapperID;
    uint8_t verticalMirror; //1 = vertical; 0 = horizontal;
    uint8_t hasRam;
    uint8_t hasTrainer;
    uint8_t ignoreMirror; //add extra vRam for all 4 screens
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
    return ((uint8_t*)data)[addr&0x3fff];
}
uint8_t mirroredVRomReader(void* data, uint16_t addr)
{
    return ((uint8_t*)data)[addr];
}
void nullWrite(void* data, uint16_t addr, uint8_t val)
{

}


void createNRom (nesCart* cart, const uint8_t* romData, const nesFileHeader* headerData)
{
    cart->cpuRom.data = romData;
    cart->cpuRom.length = 0x8000;
    cart->cpuRom.start = 0x8000;
    cart->cpuRom.writefun = nullWrite;

    cart->ppuRom.data = romData+ROM_PAGE_SIZE*headerData->nRomBanks;
    cart->ppuRom.length = 0x2000;
    cart->ppuRom.start = 0;
    cart->ppuRom.readfun = mirroredVRomReader;
    cart->ppuRom.writefun = nullWrite;

    if(headerData->nRomBanks == 2){//2 banks - full 32k rom
        cart->cpuRom.readfun = basicReader;

    }
    else {//1 bank - mirrored 16k rom
        cart->cpuRom.readfun = basicMirroredReader;
    }
    printf("made new cart with mapper type 0, %i cpu banks\n", headerData->nRomBanks);
}

void createNesCart(nesCart* cart, const char* fileName) {
    FILE* file = fopen(fileName, "rb");
    uint8_t nesstring[4];

    fread(nesstring, 1, 4, file);
    if (memcmp(nesstring, "NES", 3))
    {
        puts("not a nes file\n");
        return;
    }
    nesFileHeader headerData;
    uint8_t f6, f7;//flags about file subformat
    printf("c %i, p %i, %i\n", headerData.nRomBanks, headerData.nVRomBanks, nesstring[3]);
    fread(&headerData.nRomBanks, 1, 1, file);//byte 4
    fread(&headerData.nVRomBanks, 1, 1, file);//byte 5
    printf("c %i, p, %i\n", headerData.nRomBanks, headerData.nVRomBanks);

    fread(&f6, sizeof(uint8_t), 1, file);//byte 6
    fread(&f7, sizeof(uint8_t), 1, file);//byte 7

    {
        uint8_t ignore[8];
        fread(ignore, sizeof(uint8_t), 8, file);//ignore bytes 8-15
    }

    //high nibble of flag6 = low nibble of mapper id
    //high nibble of flag7 = high nibble of mapper id
    headerData.mapperID = (f7&0xf0) | (f6>>4);

    headerData.verticalMirror = f6&1;
    headerData.hasRam = f6&2;
    headerData.hasTrainer = f6&4;
    headerData.ignoreMirror = f6&8;

    if (headerData.hasTrainer) {
        uint8_t ignore[512];
        fread(ignore, sizeof(uint8_t), 512, file);
    }

    size_t fileDataSize = ROM_PAGE_SIZE * headerData.nRomBanks + VROM_PAGE_SIZE * headerData.nVRomBanks;
    uint8_t *gameData = malloc(sizeof(uint8_t) * fileDataSize);
    fread(gameData, sizeof(uint8_t), fileDataSize, file);
    fclose(file);

    switch(headerData.mapperID) {
        case 0:
            createNRom(cart, gameData, &headerData);
            return;

        default:
            free(gameData);
            puts("no matching format for the mapper found");
    }
}

