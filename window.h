//
// Created by joseph on 24/06/2020.
//

#ifndef NESULATOR_WINDOW_H
#define NESULATOR_WINDOW_H

#include <stdint.h>

struct nesWindow;
typedef struct nesWindow nesWindow;

int createNesWindow(nesWindow**);
void drawNesFrame(nesWindow*, const uint8_t* frameData);
void deleteNesWindow(nesWindow*);

#endif //NESULATOR_WINDOW_H
