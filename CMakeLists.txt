cmake_minimum_required(VERSION 3.10)

project(Nesulator VERSION 0.3.1)

configure_file(versionInfo.h.in versionInfo.h)

add_executable(${PROJECT_NAME}
  src/main.c
  src/apu.c 
  src/cpu.c 
  src/data.c 
  src/gameCart.c 
  src/memory.c 
  src/ppu.c 
  src/window.c
  src/cpu.h
  src/data.h
  src/apu.h
  src/gameCart.h
  src/memory.h
  src/ppu.h
  src/window.h
  src/emulatorGlue.h
)

target_include_directories(${PROJECT_NAME}
  PUBLIC src
  PUBLIC vendor/SDL/include
)

add_subdirectory(vendor/SDL EXCLUDE_FROM_ALL)

if(TARGET SDL2::SDL2main)
    # It has an implicit dependency on SDL2 functions, so it MUST be added before SDL2::SDL2 (or SDL2::SDL2-static)
    target_link_libraries(${PROJECT_NAME} PRIVATE SDL2::SDL2main)
endif()

# Link to the actual SDL2 library. SDL2::SDL2 is the shared SDL library, SDL2::SDL2-static is the static SDL libarary.
target_link_libraries(${PROJECT_NAME} PRIVATE SDL2::SDL2)

