#include "cpu.h"
#include "memory.h"
#include "gameCart.h"
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
    nesCart nc;

    createNesCart(&nc, "C:/Users/david/CLionProjects/Nesulator3.1/smb.nes");
    if (!createRamDevice816(&ram, 0x800, 0)) {
        fputs("ERROR: RAM failed to initialise\n", stderr);
        return -1;
    }
    if (!createRomDevice816(&rom, 0x8000, 0x8000)) {
        fputs("ERROR: ROM failed to initialise\n", stderr);
        return -1;
    }/*
    if (!addDevice(&mycpu, &ram)) {
        fputs(stderr, "ERROR: Failed to add RAM\n");
        return -1;
    }
    if (!addDevice(&mycpu, &rom)) {
        fputs(stderr, "ERROR: Failed to add ROM\n");
        return -1;
    }*/
    if (!addDevice(&mycpu, &nc.cpuRom)) {
        fputs("ERROR: Failed to add CPU ROM\n", stderr);
        return -1;
    }

    /*device816 eaterTests;
    eaterTests.length = 0xFFFF;
    eaterTests.readfun = eaterRead;
    eaterTests.writefun = eaterWrite;
    eaterTests.start = 0;

    //if (!addDevice(&mycpu, &eaterTests)) {
    //    puts("add eater error");
    //    return -1;
    //}
    mycpu.PC = 0xe203;
    for(int i = 0; i < 128; ++i) {
        stepCpu(&mycpu);
    }*/
    destroyRamDevice816(&ram);
    destroyRomDevice816(&rom);
    fputs("EXIT SUCCESS\n", stdout);
    printRegisters(&mycpu);

    return 0;
}