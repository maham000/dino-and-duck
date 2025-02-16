extends Area2D
@onready var game_manager = %GameManager
@onready var animation_player2 = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D  

signal snow_released

func _on_body_entered(body):
	if body.name == "player2":  
		if game_manager.snow_coins_collected >= 3:
			animation_player2.play("doneSign")  

			collision_shape.disabled = true

			game_manager.minus_point()  
			game_manager.make_snow_duck()  

	

