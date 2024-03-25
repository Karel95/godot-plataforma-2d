extends Area2D


func _on_body_entered(body):
	if body.get_name() == "Player":
		$AudioStreamPlayer.play()
		Global.coins += 1
		print(Global.coins)
		
		await get_tree().create_timer(0.1).timeout
		
		queue_free()
	


