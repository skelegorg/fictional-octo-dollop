package main

import "core:fmt"
import r "vendor:raylib"

GameScreen :: enum {
	LOGO = 0,
	TITLE,
	GAMEPLAY,
	ENDING,
}

main :: proc() {
	screenwidth: i32 = 800
	screenheight: i32 = 450

	r.InitWindow(screenwidth, screenheight, "game")

	framesCounter := 0
	currentScreen := GameScreen.LOGO

	for !r.WindowShouldClose() {

		// update code
		switch currentScreen {
		case GameScreen.LOGO:
			framesCounter += 1
			if framesCounter > 120 {
				currentScreen = GameScreen.TITLE
			}
		case GameScreen.TITLE:
			if r.IsKeyPressed(r.KeyboardKey.ENTER) ||
			   r.IsGestureDetected(r.Gesture.TAP) {
				currentScreen = GameScreen.GAMEPLAY
			}
		case GameScreen.GAMEPLAY:
			if r.IsKeyPressed(r.KeyboardKey.ENTER) ||
			   r.IsGestureDetected(r.Gesture.TAP) {
				currentScreen = GameScreen.ENDING
			}
		case GameScreen.ENDING:
			if r.IsKeyPressed(r.KeyboardKey.ENTER) ||
			   r.IsGestureDetected(r.Gesture.TAP) {
				currentScreen = GameScreen.TITLE
			}
		}

		// drawing code
		r.BeginDrawing()
		r.ClearBackground(r.RAYWHITE)

		switch currentScreen {
		case GameScreen.LOGO:
			r.DrawText("logo screen here", 20, 20, 40, r.LIGHTGRAY)
			r.DrawText("wait for 2 seconds...", 290, 220, 20, r.GRAY)
		case GameScreen.TITLE:
			r.DrawRectangle(0, 0, screenwidth, screenheight, r.GREEN)
			r.DrawText("title screen here", 20, 20, 40, r.DARKGREEN)
		case GameScreen.GAMEPLAY:
			r.DrawRectangle(0, 0, screenwidth, screenheight, r.PURPLE)
			r.DrawText("gameplay screen here", 20, 20, 40, r.MAROON)
		case GameScreen.ENDING:
			r.DrawRectangle(0, 0, screenwidth, screenheight, r.BLUE)
			r.DrawText("gameplay screen here", 20, 20, 40, r.DARKBLUE)
		}

		r.EndDrawing()
	}

	r.CloseWindow()

}
