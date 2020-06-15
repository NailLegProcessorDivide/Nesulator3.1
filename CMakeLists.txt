cmake_minimum_required(VERSION 3.16)
project(Nesulator C)

set(CMAKE_C_STANDARD 11)

add_executable(Nesulator main.c cpu.h emulatorGlue.h memory.h ppu.h cpu.c memory.c ppu.c)