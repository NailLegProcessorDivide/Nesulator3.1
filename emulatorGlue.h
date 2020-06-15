//
// Created by Joseph on 14/06/2020.
//

#ifndef NESULATOR_EMULATORGLUE_H
#define NESULATOR_EMULATORGLUE_H

#include <stdbool.h>

#define nullptr NULL

#include <stdint.h>

struct device816 {
    uint8_t(*readfun)(void*, uint16_t); // data, address
    void(*writefun)(void*, uint16_t, uint8_t); // data, address, value
    uint16_t start;
    uint16_t length;
    void* data;
};
typedef struct device816 device816;

#endif //NESULATOR_EMULATORGLUE_H
