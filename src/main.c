#include <raylib.h>

typedef struct Player {
  Vector2 position;
  float speed;
  bool canjump;
} Player;

typedef struct EnvItem {
  Rectangle rect;
  bool blocking;
  Color color;
} EnvItem;

int main() {
  const int screenwidth = 800;
  const int screenheight = 450;

  InitWindow(screenwidth, screenheight, "test window");
  SetTargetFPS(60);

  int jumpvelocity = 15;

  Player player;
  player.speed = 0.0;
  player.canjump = true;
  player.position = (Vector2){100, 100};

  EnvItem map[2];
  map[0] = (EnvItem){(Rectangle){300, 400, 100, 20}, true, SKYBLUE};
  map[1] = (EnvItem){(Rectangle){500, 400, 100, 20}, true, GRAY};

  Camera2D camera = {0};
  camera.offset = (Vector2){screenwidth / 2.0, screenheight / 2.0};
  camera.target = (Vector2){screenwidth / 2.0, screenheight / 2.0};
  camera.rotation = 0.0f;
  camera.zoom = 1.0f;

  int framecounter = 0;

  while (!WindowShouldClose()) {

    // get input

    BeginDrawing();
    ClearBackground(RAYWHITE);

    DrawText("game", 10, 10, 20, LIGHTGRAY);

    BeginMode2D(camera);

    // draw environment
    for (int i = 0; i < 2; i++) {
      DrawRectangleRec(map[i].rect, map[i].color);
    }

    EndMode2D();

    EndDrawing();
  }
}
