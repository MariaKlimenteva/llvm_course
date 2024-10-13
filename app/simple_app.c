#include "sim.h"

#define NUM_CIRCLES 15

void DrawCircle(int x, int y, int radius, int r, int g, int b) {
  for (int dy = -radius; dy < radius; dy++) {
    for (int dx = -radius; dx < radius; dx++) {
      if (dx * dx + dy * dy < radius * radius) {
        int px = x + dx;
        int py = y + dy;
        if (px >= 0 && px < SIM_X_SIZE && py >= 0 && py < SIM_Y_SIZE) {
          simPutPixel(px, py, (255 << 24) | (r << 16) | (g << 8) | b);
        }
      }
    }
  }
}

void app() {
  while (1) {
    for (int i = 0; i < SIM_X_SIZE * SIM_Y_SIZE; ++i) {
      simPutPixel(i % SIM_X_SIZE, i / SIM_X_SIZE, 0x00000000);
    }

    for (int i = 0; i < NUM_CIRCLES; i++) {
      int x = simRand() % SIM_X_SIZE;
      int y = simRand() % SIM_Y_SIZE;
      int radius = simRand() % 50 + 5;
      int r = simRand() % 256;
      int g = simRand() % 256;
      int b = simRand() % 256;
      DrawCircle(x, y, radius, r, g, b);
    }
    simFlush();
  }
}