#include "window.h"

#ifdef _WIN32
#include <SDL.h>
#else
#include "SDL2/SDL.h"
#endif

#include <stdio.h>
#include <stdlib.h>
//*
const uint8_t colours[192] = {  84, 84, 84,   0, 30,116,   8, 16,144,  48,  0,136,  68,  0,100,  92,  0, 48,  84,  4,  0,  60, 24,  0,  32, 42,  0,   8, 58,  0,   0, 64,  0,   0, 60,  0,   0, 50, 60,   0,  0,  0,   0,  0,  0,   0,  0,  0,
                               152,150,152,   8, 76,196,  48, 50,236,  92, 30,228, 136, 20,176, 160, 20,100, 152, 34, 32, 120, 60,  0,  84, 90,  0,  40,114,  0,   8,124,  0,   0,118, 40,   0,102,120,   0,  0,  0,   0,  0,  0,   0,  0,  0,
                               236,238,236,  76,154,236, 120,124,236, 176, 98,236, 228, 84,236, 236, 88,180, 236,106,100, 212,136, 32, 160,170,  0, 116,196,  0,  76,208, 32,  56,204,108,  56,180,204,  60, 60, 60,   0,  0,  0,   0,  0,  0,
                               236,238,236, 168,204,236, 188,188,236, 212,178,236, 236,174,236, 236,174,212, 236,180,176, 228,196,144, 204,210,120, 180,222,120, 168,226,144, 152,226,180, 160,214,228, 160,162,160,   0,  0,  0,   0,  0,  0};
/*/
const uint8_t colours[192] = { 255,  0,255, 255,  0,  0,   0,255,  0,   0,  0,255,  68,  0,100,  92,  0, 48,  84,  4,  0,  60, 24,  0,  32, 42,  0,   8, 58,  0,   0, 64,  0,   0, 60,  0,   0, 50, 60,   0,  0,  0,   0,  0,  0,   0,  0,  0,
                               152,150,152,   8, 76,196,  48, 50,236,  92, 30,228, 136, 20,176, 160, 20,100, 152, 34, 32, 120, 60,  0,  84, 90,  0,  40,114,  0,   8,124,  0,   0,118, 40,   0,102,120,   0,  0,  0,   0,  0,  0,   0,  0,  0,
                               236,238,236,  76,154,236, 120,124,236, 176, 98,236, 228, 84,236, 236, 88,180, 236,106,100, 212,136, 32, 160,170,  0, 116,196,  0,  76,208, 32,  56,204,108,  56,180,204,  60, 60, 60,   0,  0,  0,   0,  0,  0,
                               236,238,236, 168,204,236, 188,188,236, 212,178,236, 236,174,236, 236,174,212, 236,180,176, 228,196,144, 204,210,120, 180,222,120, 168,226,144, 152,226,180, 160,214,228, 160,162,160,   0,  0,  0,   0,  0,  0};
*/
struct nesWindow {
    SDL_Window *window;
    SDL_Renderer *renderer;
    SDL_Texture *texture;
};

int createNesWindow(nesWindow **window) {
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        fprintf(stderr, "ERROR: could not init SDL: %s\n", SDL_GetError());
        return -1;
    }
    nesWindow *nesWind = malloc(sizeof(nesWindow));
    nesWind->window = SDL_CreateWindow("nesulator", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 1024, 960, 0);
    if (!nesWind->window) {
        fprintf(stderr, "ERROR: could not initialise window");
        return -1;
    }
    nesWind->renderer = SDL_CreateRenderer(nesWind->window, -1, SDL_RENDERER_SOFTWARE);
    if (!nesWind->renderer) {
        fprintf(stderr, "ERROR: could not create renderer\n");
        return -1;
    }
    nesWind->texture = SDL_CreateTexture(nesWind->renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STATIC, 1024,
                                         960);
    if (!nesWind->texture) {
        fprintf(stderr, "ERROR: could not create texture\n");
        return -1;
    }
    *window = nesWind;
    return 0;
}

bool drawNesFrame(nesWindow *nesWind, const uint8_t *frameData) {
    SDL_Event event;
    while( SDL_PollEvent( &event ) != 0 ) {
        if( event.type == SDL_QUIT ) {
            return true;
        }
    }
    uint32_t* pixelBuffer = malloc(256 * 240 * 16 * sizeof(uint32_t));
    for (int y = 0; y < 240; ++y) {
        for (int x = 0; x < 256; ++x) {
            uint8_t col = frameData[x + y * 256] & 0x3F;
            uint32_t pixcol = (colours[col * 3] << 16) | (colours[col * 3 + 1] << 8) | (colours[col * 3 + 2]);
            for (int j = 0; j < 16; ++j) {
                pixelBuffer[((x * 4 + (j & 3)) + (y * 4 + (j >> 2)) * 256 * 4)] = pixcol;
            }
        }
    }
    SDL_UpdateTexture(nesWind->texture, NULL, pixelBuffer, 1024 * sizeof(Uint32));
    free(pixelBuffer);
    SDL_RenderCopy(nesWind->renderer, nesWind->texture, NULL, NULL);
    SDL_RenderPresent(nesWind->renderer);
    SDL_Delay(20);
    //printf("frame\n");
    return false;
}

void deleteNesWindow(nesWindow *nw) {
    SDL_DestroyWindow(nw->window);
    SDL_DestroyRenderer(nw->renderer);
    SDL_DestroyTexture(nw->texture);
    free(nw);
}