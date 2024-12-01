extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0
const acceleration=50
const frict=70

var gravity=ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var jump_audio = $AudioStreamPlayer2D
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_audio.play()

	# Get the input direction 
	var direction = Input.get_axis("move_left", "move_right")
	
	#Flip direction
	if direction>0:
		animated_sprite.flip_h=false
	elif direction<0:
		animated_sprite.flip_h=true
	
	#play animations
	if is_on_floor():
		if direction==0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
