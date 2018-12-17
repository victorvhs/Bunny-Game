extends CanvasLayer

func _ready():
	Global.GUI = self
	
func update_GUI(lives):
	$banner/HBoxContainer/lblLife.text = str(lives)
	