extends Control

@onready var click = $AudioStreamPlayer2D

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level 1.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
