extends Node2D

func _on_texture_button_pressed():
	get_tree().change_scene_to_packed(load("res://scenes/Mundo2.tscn"))

func _ready():
	$ASPMundo1.playing = true
	
