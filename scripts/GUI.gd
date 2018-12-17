extends CanvasLayer

func _ready():
	Global.GUI = self
	
func update_GUI(lives):
	if int($banner/HBoxContainer/lblLife.text) < lives:
		$AnimationPlayer.play("LifePulse")
	else:
		$AnimationPlayer.play("Hurt")
		
	$banner/HBoxContainer/lblLife.text = str(lives)
	

func coins(coins):
	$banner/HBoxContainer/lblCoin.text = str(coins)
	$AnimationPlayer.play("CoinPulse")