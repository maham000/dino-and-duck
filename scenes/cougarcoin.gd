extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	if game_manager.snow_coins_collected >=1:
		if body.name == "player2":  
			game_manager.minus_point()
			game_manager.kill_enemy()
			animation_player.play("pickup")
