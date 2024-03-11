extends CanvasLayer

func _process(_delta):
	
	$TextureRect/Coins.text = str(Global.coins)
	
	if $TextureRect/Coins.text == "10":
		get_tree().change_scene_to_packed(load("res://scenes/Mundo.tscn"))
		Global.coins = 0
