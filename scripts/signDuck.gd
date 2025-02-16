extends Area2D
@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer
signal snow_released

func _on_body_entered(body):
	if body.name == "player2":  
		snow_released.emit()
		if  game_manager.score>=3:
			game_manager.minus_point()
			animation_player.play("sign done")  
		else:
			animation_player.play("sign")  

