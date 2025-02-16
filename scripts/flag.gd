extends Area2D

@onready var game_manager = %GameManager
var dino_touching_flag = false  
var snow_duck_touching_flag = false  

signal level_complete  

func _on_body_entered(body):
	if body.name == "player":  
		dino_touching_flag = true  
	if body.name == "player2":  
		snow_duck_touching_flag = true  

	if dino_touching_flag and snow_duck_touching_flag and game_manager.is_target_met:
		emit_signal("level_complete")  
		game_manager._transition_to_next_level()
