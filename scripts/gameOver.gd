extends Control

func _ready():
	Global.GameOver = self
	

func _on_btnNew_pressed():
	get_tree().change_scene("res://scenes/Levels/Level1.tscn")

func update_coin(coin):
	$btnCoin/lblcoin.text = str(coin)