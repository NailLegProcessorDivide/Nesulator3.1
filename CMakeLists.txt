cmake_minimum_required(VERSION 3.10)

project(Nesulator VERSION 0.3.1)

configure_file(versionInfo.h.in versionInfo.h)

include_directories("${PROJECT_BINARY_DIR}")

find_package(SDL2 REQUIRED)
include_directories(${SDL2_INCLUDE_DIRS})

add_executable(Nesulator apu.c cpu.c data.c gameCart.c main.c memory.c ppu.c window.c)
target_link_libraries(Nesulator ${SDL2_LIBRARIES})

