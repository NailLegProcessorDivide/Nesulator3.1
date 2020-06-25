#include "window.h"

#include "SDL2/SDL.h"

const uint8_t colours[192] = {0,    1,   2,      3,   4,   5,      6,   7,   8,      9,  10,  11,
                             12,   13,  14,     15,  16,  17,     18,  19,  20,     21,  22,  23,
                             24,   25,  26,     27,  28,  29,     30,  31,  32,     33,  34,  35,
                             36,   37,  38,     39,  40,  41,     42,  43,  44,     45,  46,  47,
                             48,   49,  50,     51,  52,  53,     54,  55,  56,     57,  58,  59,
                             60,   61,  62,     63,  64,  65,     66,  67,  68,     69,  70,  71,
                             72,   73,  74,     75,  76,  77,     78,  79,  80,     81,  82,  83,
                             84,   85,  86,     87,  88,  89,     90,  91,  92,     93,  94,  95,
                             96,   97,  98,     99, 100, 101,    102, 103, 104,    105, 106, 107,
                             108, 109, 110,    111, 112, 113,    114, 115, 116,    117, 118, 119,
                             120, 121, 122,    123, 124, 125,    126, 127, 128,    129, 130, 131,
                             132, 133, 134,    135, 136, 137,    138, 139, 140,    141, 142, 143,
                             144, 145, 146,    147, 148, 149,    150, 151, 152,    153, 154, 155,
                             156, 157, 158,    159, 160, 161,    162, 163, 164,    165, 166, 167,
                             168, 169, 170,    171, 172, 173,    174, 175, 176,    177, 178, 179,
                             180, 181, 182,    183, 184, 185,    186, 187, 188,    189, 190, 191};

struct nesWindow {
    SDL_Window *window;
    SDL_Renderer *renderer;
    SDL_Texture* texture;
};

int createNesWindow(nesWindow **window) {
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        fprintf(stderr, "Could not init SDL: %s\n", SDL_GetError());
        return -1;
    }
    nesWindow *nesWind = malloc(sizeof(nesWindow));
    nesWind->window = SDL_CreateWindow("nesulator", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 1024, 960, 0);
    if (!nesWind->window) {
        fprintf(stderr, "Could not initialise window");
        return -1;
    }
    nesWind->renderer = SDL_CreateRenderer(nesWind->window, -1, SDL_RENDERER_SOFTWARE);
    if (!nesWind->renderer) {
        fprintf(stderr, "Could not create renderer\n");
        return -1;
    }
    nesWind->texture = SDL_CreateTexture(nesWind->renderer, SDL_PIXELFORMAT_XRGB8888, SDL_TEXTUREACCESS_STATIC, 1024, 960);
    if(!nesWind->texture) {
        fprintf(stderr, "Could not create texture\n");
        return -1;
    }
    *window = nesWind;
    return 0;
}

void drawNesFrame(nesWindow *nesWind, const uint8_t *frameData) {
    uint32_t pixelBuffer[256*240*16];
    for (int y = 0; y < 240; ++y) {
        for (int x = 0; x < 256; ++x) {
            uint8_t col = frameData[x+y*256] & 0x3F;
            uint32_t pixcol = (colours[col * 3] << 16) | (colours[col * 3 + 1] << 8) | (colours[col * 3 + 2]);
            for (int j = 0; j < 16; ++j) {
                pixelBuffer[((x*4+(j&3)) + (y*4+(j>>2))*256*4)] = pixcol;
            }
        }
    }
    SDL_UpdateTexture(nesWind->texture, NULL, pixelBuffer, 1024 * sizeof(Uint32));
    SDL_RenderCopy(nesWind->renderer, nesWind->texture, NULL, NULL);
    SDL_RenderPresent(nesWind->renderer);
    SDL_Delay(20);
    printf("frame\n");
}

void deleteNesWindow(nesWindow *nw) {
    SDL_DestroyWindow(nw->window);
    SDL_DestroyRenderer(nw->renderer);
    SDL_DestroyTexture(nw->texture);
    free(nw);
}