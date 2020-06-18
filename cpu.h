//
// Created by Joseph on 14/06/2020.
//

#ifndef NESULATOR_CPU_H
#define NESULATOR_CPU_H

#include <stdint.h>
#include <stdlib.h>
#include "emulatorGlue.h"

struct mos6502 {
	uint8_t A, X, Y, SP;
	uint16_t PC;
	uint8_t flags;
	uint8_t interrupts;
	device816* devices;
	size_t deviceCount;
};

struct cpuState {
	uint8_t A, X, Y;
	uint16_t PC;
	uint8_t FLAGS;
};

typedef struct mos6502 mos6502;
typedef struct cpuState cpuState;

void createCpu(mos6502*);
int stepCpu(mos6502*);
makeDeviceAdderDeclaration(mos6502);

void triggerNMI(mos6502* _cpu);
void triggerRST(mos6502* _cpu);
void triggerIRQ(mos6502* _cpu);

void printRegisters(mos6502* _cpu);

typedef int (*mos6502instruction)(mos6502*);

#endif //NESULATOR_CPU_H
