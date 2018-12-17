extends Node2D

export var start_live = 3
var lives
var coins = 0

func _ready():
	Global.GameState = self
	lives = start_live
	update_GUI()
	
func update_GUI():
	Global.GUI.update_GUI(lives)

func hurt():
	lives -= 1
	Global.Player.hurtJump()
	update_GUI()
	if lives <  0:
		end_game()

func coins_up():
	coins += 1
	Global.GUI.coins(coins)

func end_game():
	get_tree().change_scene("res://scenes/gameOver.tscn")