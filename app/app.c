#include "sim.h"

#define NUM_CIRCLES 15

typedef struct {
    int x;
    int y;
    int radius;
    int sizeChangeSpeed;
    int colorChangeSpeed;
    int xSpeed;
    int ySpeed;
    int r;
    int g;
    int b;
} Circle;

Circle circles[NUM_CIRCLES];

int getAbsVelocity(int v1, int v2) {
  if (v1 < 0) {
    v1 = -v1;
  }
  if (v2 < 0) {
    v2 = -v2;
  }
  return (v1 + v2) & 0xFF;
}

void DrawCircle(int x, int y, int radius, int abs_velocity, int r, int g, int b) {
    for (int dy = -radius; dy < radius; dy++) {
        for (int dx = -radius; dx < radius; dx++) {
            if (dx * dx + dy * dy < radius * radius) {
                int px = x + dx;
                int py = y + dy;
                int argb = (255 << 24) | (r << 16) | (g << 8) | b; 
                simPutPixel(px, py, argb + (abs_velocity * 10 << 6));
            }
        }
    }
}

void app() {
    for (int i = 0; i < NUM_CIRCLES; i++) {
        circles[i].x = simRand() % SIM_X_SIZE;
        circles[i].y = simRand() % SIM_Y_SIZE;
        circles[i].r = simRand() % 128 + 128;
        circles[i].g = simRand() % 256;
        circles[i].b = simRand() % 128;
        circles[i].radius = simRand() % 50 + 2;

        circles[i].sizeChangeSpeed = simRand() % 5 + 1;
        circles[i].colorChangeSpeed = simRand() % 128 + 1;
        circles[i].xSpeed = (simRand() % 2) - 1; 
        circles[i].ySpeed = (simRand() % 2) - 1; 
        
    }
    
    while (1) {

        for (int i = 0; i < NUM_CIRCLES; i++) {
            
            circles[i].radius += circles[i].sizeChangeSpeed;
            if (circles[i].radius > SIM_X_SIZE / 12) {
                circles[i].radius = simRand() % 50 + 2;
            }

            circles[i].x = simRand() % SIM_X_SIZE;
            circles[i].y = simRand() % SIM_Y_SIZE;
            circles[i].r = (circles[i].r + circles[i].colorChangeSpeed ) % 256;
            circles[i].g = (circles[i].g + circles[i].colorChangeSpeed) % 256;
            circles[i].b = (circles[i].b + circles[i].colorChangeSpeed ) % 256;
            
            DrawCircle(circles[i].x, circles[i].y, circles[i].radius, 
            getAbsVelocity(circles[i].xSpeed, circles[i].ySpeed), circles[i].r, circles[i].g, circles[i].b);     
            simFlush();
        }
    }
}
