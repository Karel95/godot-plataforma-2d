extends Area2D



func _on_body_entered(body):
	if body.get_name() == "Player":
		print("Te has pinchado!")
		get_tree().reload_current_scene()
		Global.coins = 0

