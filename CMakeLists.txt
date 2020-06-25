cmake_minimum_required(VERSION 3.15)
project(Nesulator)

set(CMAKE_C_STANDARD 11)

set(SDL2_INCLUDE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/SDL2/include")

if (${CMAKE_SIZEOF_VOID_P} MATCHES 8)
    set(SDL2_LIBRARIES "${CMAKE_CURRENT_SOURCE_DIR}/SDL2/lib/x64/SDL2.lib;${CMAKE_CURRENT_SOURCE_DIR}/SDL2/lib/x64/SDL2main.lib")
else ()
    set(SDL2_LIBRARIES "${CMAKE_CURRENT_SOURCE_DIR}/SDL2/lib/x86/SDL2.lib;${CMAKE_CURRENT_SOURCE_DIR}/SDL2/lib/x86/SDL2main.lib")
endif ()

include_directories(${SDL2_INCLUDE_DIRS})

add_executable(Nesulator main.c cpu.h emulatorGlue.h memory.h ppu.h cpu.c memory.c ppu.c gameCart.c gameCart.h data.c data.h)

target_link_libraries(Nesulator ${SDL2_LIBRARIES})