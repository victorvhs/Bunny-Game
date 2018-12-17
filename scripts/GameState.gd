extends Node2D

export var start_live = 3
var lives

func _ready():
	Global.GameState = self
	lives = start_live

func hurt():
	lives -= 1
	Global.Player.hurtJump()
	if lives <  0:
		end_game()
		

func end_game():
	get_tree().change_scene("res://scenes/gameOver.tscn")