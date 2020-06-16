#include "memory.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

uint8_t readMem816(void *mem, uint16_t add) {
    printf("READ MEM @ 0x%04X\n", add);
    return ((uint8_t *) mem)[add];
}

void writeRom816(void *mem, uint16_t add, uint8_t val) {
    //do nothing (READ ONLY)
}

void writeRam816(void *mem, uint16_t add, uint8_t val) {
    ((uint8_t *) mem)[add] = val;
}

bool createRomDevice816(device816 *dev, uint16_t size, uint16_t offset) {
    dev->data = malloc(sizeof(uint8_t) * size);
    dev->length = size;
    dev->start = offset;
    dev->readfun = &(readMem816);
    dev->writefun = &(writeRom816);
    return dev->data;
}

void destroyRomDevice816(device816 *dev) {
    if (dev->data)
        free(dev->data);
}

bool createRamDevice816(device816 *dev, uint16_t size, uint16_t offset) {
    dev->data = malloc(sizeof(uint8_t) * size);
    dev->length = size;
    dev->start = offset;
    dev->readfun = &(readMem816);
    dev->writefun = &(writeRam816);
    return dev->data;
}

void destroyRamDevice816(device816 *dev) {
    if (dev->data)
        free(dev->data);
}

void clearMem(device816 *dev) {
    memset(dev->data, 0, dev->length * sizeof(uint8_t));
}
