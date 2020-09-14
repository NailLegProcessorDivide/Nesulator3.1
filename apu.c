//
// Created by joseph on 30/06/2020.
//

#include "apu.h"

#include <stdio.h>
#include "string.h"

uint8_t read_mos6502(mos6502* base, uint16_t address);//cheat the function descriptor for the cpu reader cause im a bad person

void tickAPURP2A03(apuRP2A03 *_apu) {

}

void createAPURP2A03(apuRP2A03 *_apu, ppu2A03 *_ppu, mos6502 *_cpu) {
    memset(_apu, 0, sizeof(apuRP2A03));
    _apu->ppu = _ppu;
    _apu->cpu = _cpu;
}

uint8_t noRead(void* v, uint16_t u) {
    return 0;
}

void writeDma(void* apu, uint16_t addr, uint8_t val) {
    apuRP2A03 *_apu = apu;
    for(int i = 0; i < 256; ++i){
        _apu->ppu->oamram[i] = read_mos6502(_apu->cpu, (val<<8)+i);
    }
    printf("oamdma, 0x%02X\n", val);
}

void createAPUDevice(device816 *dev, apuRP2A03 *_apu){}

void createDMADevice(device816 *dev, apuRP2A03 *_apu){
    dev->data = _apu;
    dev->length = 1;
    dev->start = 0x4018;
    dev->readfun = noRead;
    dev->writefun = writeDma;
}