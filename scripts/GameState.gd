extends Node2D

export var start_live = 3
var lives
func _ready():
	Global.GameState = self
	lives = start_live

func end_game():
	get_tree().change_scene("res://scenes/gameOver.tscn")