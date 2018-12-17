extends Node2D

export var start_live = 3
export var coin_target = 15

var lifes
var coins = 0

func _ready():
	Global.GameState = self
	lifes = start_live
	update_GUI()
	
func update_GUI():
	Global.GUI.update_GUI(lifes)

func hurt():
	lifes -= 1
	Global.Player.hurtJump()
	update_GUI()
	if lifes <  0:
		end_game()

func coins_up():
	coins += 1
	Global.GUI.coins(coins)
	var extra_life =  (coins % coin_target) == 0
	if extra_life:
		life_up()

func life_up():
	lifes +=1
	update_GUI()

func end_game():
	get_tree().change_scene("res://scenes/gameOver.tscn")