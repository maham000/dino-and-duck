extends Area2D

@onready var game_manager = %GameManager

signal level_complete  

func _on_body_entered(body):
	emit_signal("level_complete")  
	if game_manager.score >= 5:
		game_manager._transition_to_next_level()
