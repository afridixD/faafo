extends Area2D

@export var target_level: PackedScene
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var timer = $Timer

func animations():
	if timer>1:
		animated_sprite_2d.play("idle")

#func _on_body_entered(body):
	#if body.is_in_group("Player"):
		#get_tree().change_scene_to_packed(target_level)
