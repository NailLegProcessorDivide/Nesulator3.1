cmake_minimum_required(VERSION 3.15)
project(Nesulator C)

set(CMAKE_C_STANDARD 11)

find_package(SDL2 REQUIRED)
INCLUDE_DIRECTORIES(${SDL2_INCLUDE_DIRS})

add_executable(Nesulator main.c cpu.h emulatorGlue.h memory.h ppu.h cpu.c memory.c ppu.c gameCart.c gameCart.h data.c data.h window.c window.h)


TARGET_LINK_LIBRARIES(${PROJECT_NAME} ${SDL2_LIBRARIES})