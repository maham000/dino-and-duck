extends Node2D

const SPEED = 60

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

var direction = 1


func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
		
	position.x += direction * SPEED * delta


func _on_body_entered(body):
	if body.is_in_group("player2"):  
		
		if game_manager.snow_coins_collected > 0:  

			game_manager.snow_coins_collected -= 1  
			queue_free()  
			print("Duck removed the Cougar! 1 Snow used.")
		
