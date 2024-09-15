#include "cpu.h"
#include "ppu.h"
#include "apu.h"
#include "memory.h"
#include "gameCart.h"
#include <stdio.h>

#include <time.h>

#ifdef _WIN32
#define TEST_FILE "X:/nestest.nes"
#else
#define TEST_FILE "~/roms/nestest.nes"
#endif

int main(int iargs, char **args) {
    const char *nesFilePath = TEST_FILE;
    const size_t maxLineLen = 1023;
    char nameBuffer[1024];

    // printf("Nesulator version %i.%i.%i\n", VERSION_MAJOR, VERSION_MINOR, VERSION_PATCH);

    if (iargs > 1) {
        nesFilePath = args[1];
    } else if (scanf("%1023[^\n]", nameBuffer) > 0) {
        nesFilePath = nameBuffer;
        puts("scf");
    }

    mos6502 mycpu;
    ppu2A03 myppu;
    apuRP2A03 myapu;
    createCpu(&mycpu);
    device816 ram;
    device816 rom;
    device816 OAMDMA;
    device816 ppuDev;
    nesCart nc;

    printf("Using file: %s\n", nesFilePath);

    if (createNesCart(&nc, &myppu, nesFilePath)) {
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

    createPPU(&myppu);
    createAPURP2A03(&myapu, &myppu, &mycpu);

    createPPUDevice(&ppuDev, &myppu);
    add_mos6502_device(&mycpu, &ppuDev);

    createDMADevice(&OAMDMA, &myapu);
    add_mos6502_device(&mycpu, &OAMDMA);

    add_ppu2A03_device(&myppu, &nc.chrRom);

    printf("ready to launch\n");
    long long nesTime = 0;

    clock_t start, end;
    long long cpu_time_clocks;
    double cpu_time_used;

    start = clock();

    triggerRST(&mycpu);
    //mycpu.PC = 0xc000;
    //for (int i = 0; i < 45000; ++i) {
    for (int i = 0; ; ++i) {
        int instLen = stepCpu(&mycpu);
        for (int j = 0; j < instLen * 3; ++j) {
            if(stepPPU(&myppu, &mycpu)) goto yesIHateMySelf;
        }
        nesTime += instLen;
    }

yesIHateMySelf:

    end = clock();
    cpu_time_clocks = ((long long) (end - start));
    cpu_time_used = ((double) cpu_time_clocks) / CLOCKS_PER_SEC;

    double nesTimeSecs = nesTime / 1789773.;

    printf("\ntime taken %lld clocks (%f seconds)\n", cpu_time_clocks, cpu_time_used);
    printf("simulated %lld nes clocks (%f seconds of nes time)\n", nesTime, nesTimeSecs);
    printf("nes clock running at %f times real time\n\n", nesTimeSecs / cpu_time_used);

    destroyRamDevice816(&ram);
    destroyRomDevice816(&rom);

    destroyPPU(&myppu);
    fputs("EXIT SUCCESS\n", stdout);
    printRegisters(&mycpu);

    return 0;
}
