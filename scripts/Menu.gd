extends Control


func _ready():
	$VBoxContainer/StartGameButton.grab_focus()
	$AudioStreamPlayer.play()


func _on_start_game_button_pressed():
	get_tree().change_scene_to_packed(load("res://scenes/Mundo.tscn"))


func _on_quit_button_pressed():
	get_tree().quit()


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
