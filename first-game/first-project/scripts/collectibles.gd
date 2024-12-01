extends Area2D

@onready var game_mng = %GameMng

@onready var animated_sprite = $AnimatedSprite2D

func _on_body_entered(body):
	if body.name=="Player":
		game_mng.add_points()
		animated_sprite.play("collected")
		await animated_sprite.animation_finished
		queue_free()
		


	
	
