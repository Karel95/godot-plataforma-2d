extends Area2D



func _on_body_entered(body):
	if body.get_name() == "Player":
		$"../ASP2DPlayerDead".play()
		print("Te has pinchado!")
		
		await get_tree().create_timer(0.1).timeout
		
		get_tree().reload_current_scene()
		Global.coins = 0

