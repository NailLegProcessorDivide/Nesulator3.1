//
// Created by Joseph on 14/06/2020.
//

#ifndef NESULATOR_EMULATORGLUE_H
#define NESULATOR_EMULATORGLUE_H

#include <stdbool.h>
#include <stdlib.h>

#define nullptr NULL

#include <stdint.h>

//#define pprintf(...) printf(__VA_ARGS__)
//#define fpprintf(...) fprintf(__VA_ARGS__)
#define pprintf(...)
#define fpprintf(...)

struct device816 {
    uint8_t (*readfun)(void *, uint16_t); // data, address
    void (*writefun)(void *, uint16_t, uint8_t); // data, address, value
    uint16_t start;
    uint16_t length;
    void *data;
};

typedef struct device816 device816;

// macros are defined inside the "base" type C files

#define makeDeviceReader(type) uint8_t read_##type(type* base, uint16_t address) {\
    uint8_t val = 0;\
    for (size_t i = 0; i < base->deviceCount; i++) {\
        device816* dev = &base->devices[i];\
        /*printf("dev: 0x%04x\n", dev->start);*/\
        if (dev->start <= address && dev->start + dev->length > address) {\
            /*printf("reading "#type" mem at address %X\n", address);*/\
            val = dev->readfun(dev->data, address - dev->start);\
            /*printf(">>\n");*/\
        }\
    }\
    /*fprintf(stdout, "READ %04X %02X\n", address, val);*/\
    printf(#type"-dev: %p, addr: 0x%04X, val: 0x%02X\n", base, address, val);\
    return val;\
}

/*
#define debugWrite(a, b) a
/*/
#define debugWrite(a, b) b
//*/

#define makeDeviceWriter(type) void write_##type(type* base, uint16_t address, uint8_t value) {\
    debugWrite(printf("WRITE %04X %02X\n", address, value),);\
    for (size_t i = 0; i < base->deviceCount; i++) {\
        device816 *dev = &base->devices[i];\
        debugWrite(printf("WRITE %04X %04X\n", dev->start, dev->length),);\
        if (dev->start <= address && dev->start + dev->length > address) {\
            debugWrite(fprintf(stderr, "%p %p ", dev->writefun, dev->data),);\
            debugWrite(fprintf(stderr, "WRITE %04X %04X %04X %02X\n", dev->start, dev->length, address - dev->start, value),);\
            debugWrite(printf("WRITE %04X %04X\n", dev->start, dev->length),);\
            dev->writefun(dev->data, address - dev->start, value);\
            debugWrite(printf("lWRITE %04X %04X\n", dev->start, dev->length),);\
            debugWrite(fprintf(stderr, "lWRITE %04X %04X %04X %02X\n", dev->start, dev->length, address - dev->start, value),);\
        }\
    }\
}

#define makeDeviceAdderDeclaration(type) bool add_##type##_device(type* base, const device816 *dev);

#define makeDeviceAdder(type) bool add_##type##_device(type* base, const device816 *dev) {\
    device816 *newdevs;\
    base->deviceCount++;\
    newdevs = (device816 *) realloc(base->devices, base->deviceCount * sizeof(device816));\
    if (newdevs == nullptr) {\
        free(base->devices);\
        base->deviceCount = 0;\
        return false;\
    } else {\
        base->devices = newdevs;\
        base->devices[base->deviceCount - 1] = *dev;\
        return true;\
    }\
}

#endif //NESULATOR_EMULATORGLUE_H
