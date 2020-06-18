cmake_minimum_required(VERSION 3.15)
project(Nesulator C)

set(CMAKE_C_STANDARD 11)

add_executable(Nesulator main.c cpu.h emulatorGlue.h memory.h ppu.h cpu.c memory.c ppu.c gameCart.c gameCart.h data.c data.h)