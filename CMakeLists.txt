cmake_minimum_required(VERSION 3.16)
project(Nesulator)

set(CMAKE_C_STANDARD 11)

if(WIN32)
    set(SDL2_INCLUDE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/SDL2/include")

    if (${CMAKE_SIZEOF_VOID_P} MATCHES 8)
        set(SDL2_LIBRARIES "${CMAKE_CURRENT_SOURCE_DIR}/SDL2/lib/x64/SDL2.lib;${CMAKE_CURRENT_SOURCE_DIR}/SDL2/lib/x64/SDL2main.lib")
    else ()
        set(SDL2_LIBRARIES "${CMAKE_CURRENT_SOURCE_DIR}/SDL2/lib/x86/SDL2.lib;${CMAKE_CURRENT_SOURCE_DIR}/SDL2/lib/x86/SDL2main.lib")
    endif ()
endif()

if(UNIX)
    find_package(SDL2 REQUIRED)
endif()

include_directories(${SDL2_INCLUDE_DIRS})

add_executable(${PROJECT_NAME} main.c cpu.h emulatorGlue.h memory.h ppu.h cpu.c memory.c ppu.c gameCart.c gameCart.h data.c data.h window.c window.h apu.h apu.c)

target_link_libraries(${PROJECT_NAME} ${SDL2_LIBRARIES})
