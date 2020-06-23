#include "cpu.h"
#include "memory.h"
#include "gameCart.h"
#include <stdio.h>

#include <time.h>

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

<<<<<<< HEAD
    if(createNesCart(&nc, "X:/nestest.nes")){
=======
    if(createNesCart(&nc, "/home/joseph/Downloads/nestest.nes")){
    //if(createNesCart(&nc, "X:\\nestest.nes")){
>>>>>>> 236b0e1eca99fe753ce55159072ea1285eaa9f91
        return -1;
    }


    if (!createRamDevice816(&ram, 0x800, 0)) {
        fputs("ERROR: RAM failed to initialise\n", stderr);
        return -1;
    }
    if (!createRomDevice816(&rom, 0x8000, 0x8000)) {
        fputs("ERROR: ROM failed to initialise\n", stderr);
        return -1;
    }
    if (!add_mos6502_device(&mycpu, &ram)) {
        fputs("ERROR: Failed to add CPU RAM\n", stderr);
        return -1;
    }
    if (!add_mos6502_device(&mycpu, &nc.prgRom)) {
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
    */
    long long nesTime = 0;

    clock_t start, end;
    long long cpu_time_clocks;
    double cpu_time_used;

    start = clock();

    triggerRST(&mycpu);
    mycpu.PC = 0xc000;
    for(int i = 0; i < 4800; ++i) {
        nesTime += stepCpu(&mycpu);
    }

    end = clock();
    cpu_time_clocks = ((long long) (end - start));
    cpu_time_used = ((double) cpu_time_clocks)/CLOCKS_PER_SEC;

    double nesTimeSecs = nesTime / 1789773.;

    printf("\ntime taken %lld clocks (%f seconds)\n", cpu_time_clocks, cpu_time_used);
    printf("simulated %lld nes clocks (%f seconds of nes time)\n", nesTime, nesTimeSecs);
    printf("nes clock running at %f times real time\n\n", nesTimeSecs/cpu_time_used);

    destroyRamDevice816(&ram);
    destroyRomDevice816(&rom);
    fputs("EXIT SUCCESS\n", stdout);
    printRegisters(&mycpu);

    return 0;
}