#include "sim.h"

#define DROP_CHANCE 10
#define DROP_RADIUS 2
#define DROP_DEPTH 1024
#define DAMPING 5
#define LIGHT_Z 256.0f
#define AMBIENT 20
#define BRIGHTNESS 100.0f

int getHeight(int *field, int x, int y) {
  if (x < 0 || x >= SIM_X_SIZE || y < 0 || y >= SIM_Y_SIZE)
    return 0;
  return field[SIM_X_SIZE * y + x];
}

float invSqrt(float v) {
  unsigned int i = 0x5F3759DF - (*(unsigned int *)&v >> 1);
  return *(float *)&i;
}

void drawField(int *field) {
  for (int y = 0; y < SIM_Y_SIZE; y++)
    for (int x = 0; x < SIM_X_SIZE; x++) {
      float s = getHeight(field, x - 1, y) - getHeight(field, x + 1, y) +
                getHeight(field, x, y - 1) - getHeight(field, x, y + 1);
      float light = (s + LIGHT_Z) * invSqrt(s * s + LIGHT_Z * LIGHT_Z);
      int c = AMBIENT + (int)((light > 0 ? light : 0) * BRIGHTNESS);
      simPutPixel(x, y, 0xFF000000 + ((c / 5) << 16) + ((c * 3 / 5) << 8) + c);
    }
}

void addDrop(int *field, int x, int y) {
  for (int dy = -DROP_RADIUS; dy <= DROP_RADIUS; dy++)
    for (int dx = -DROP_RADIUS; dx <= DROP_RADIUS; dx++)
      if (dx * dx + dy * dy <= DROP_RADIUS * (DROP_RADIUS + 1))
        field[SIM_X_SIZE * (y + dy) + x + dx] -= DROP_DEPTH;
}

void calcField(int *prev, int *next) {
  for (int y = 0; y < SIM_Y_SIZE; y++)
    for (int x = 0; x < SIM_X_SIZE; x++) {
      int h = ((getHeight(prev, x - 1, y) + getHeight(prev, x + 1, y) +
                getHeight(prev, x, y - 1) + getHeight(prev, x, y + 1)) >> 1) -
              next[SIM_X_SIZE * y + x];
      next[SIM_X_SIZE * y + x] = h - (h >> DAMPING);
    }
}

void app(void) {
  int field1[SIM_Y_SIZE * SIM_X_SIZE] = {};
  int field2[SIM_Y_SIZE * SIM_X_SIZE] = {};
  int *prev = field1;
  int *next = field2;
  while (1) {
    drawField(prev);
    simFlush();
    if (simRand() % DROP_CHANCE == 0)
      addDrop(prev, DROP_RADIUS + simRand() % (SIM_X_SIZE - 2 * DROP_RADIUS),
              DROP_RADIUS + simRand() % (SIM_Y_SIZE - 2 * DROP_RADIUS));
    calcField(prev, next);
    int *tmp = prev;
    prev = next;
    next = tmp;
  }
}
