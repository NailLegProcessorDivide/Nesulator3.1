#include "cpu.h"
#include "memory.h"

#include <stdio.h>

uint8_t eaterRead(void* data, uint16_t add) {
    return 0xea;
}
void eaterWrite(void* data, uint16_t add, uint8_t val) {

}

int main(int iargs, char** args){
    mos6502 mycpu;
    createCpu(&mycpu);
    device816 ram;
    device816 rom;
    if (!createRamDevice816(&ram, 0x800, 0)) {
        printf("ram error");
        return -1;
    }
    if (!createRomDevice816(&rom, 0x8000, 0x8000)) {
        printf("rom error");
        return -1;
    }/*
    if (!addDevice(&mycpu, &ram)) {
        printf("add ram error");
        return -1;
    }
    if (!addDevice(&mycpu, &rom)) {
        printf("add rom error");
        return -1;
    }*/
    ((uint8_t*)rom.data)[0] = 0x79;
    ((uint8_t*)rom.data)[1] = 0x00;
    ((uint8_t*)rom.data)[2] = 0x00;
    ((uint8_t*)rom.data)[3] = 0x79;
    ((uint8_t*)rom.data)[4] = 0x01;
    ((uint8_t*)rom.data)[5] = 0x00;
    ((uint8_t*)rom.data)[6] = 0x69;
    ((uint8_t*)rom.data)[7] = 0x01;
    ((uint8_t*)ram.data)[0] = 0x81;
    ((uint8_t*)ram.data)[1] = 0x80;

    device816 eaterTests;
    eaterTests.length = 0xFFFF;
    eaterTests.readfun = eaterRead;
    eaterTests.writefun = eaterWrite;
    eaterTests.start = 0;

    if (!addDevice(&mycpu, &eaterTests)) {
        printf("add eater error");
        return -1;
    }

    for(int i = 0; i < 64; ++i) {
        stepCpu(&mycpu);
    }
    destroyRamDevice816(&ram);
    destroyRomDevice816(&rom);
    printf("successful run, A = 0x%02X\n", mycpu.A);

    return 0;
}