extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta


	if Input.is_action_just_pressed("jumpP2") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("move_leftP2", "move_rightP2")

	if direction > 0:
		animated_sprite.flip_h = true
	elif direction < 0:
		animated_sprite.flip_h = false

	if is_on_floor():
		if direction == 0: 
			animated_sprite.play("duck idle")
		else:
			animated_sprite.play("duck walk")
	else:
		animated_sprite.play("ducktakeoff")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
