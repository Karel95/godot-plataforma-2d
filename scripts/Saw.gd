extends Node2D

func _ready():
	$AnimationPlayer.play("rotateAnimation")


func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		print("Te has pinchado!")
		get_tree().reload_current_scene()
		Global.coins = 0
