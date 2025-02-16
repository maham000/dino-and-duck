extends Area2D
@onready var game_manager = %GameManager
signal snow_collected

func _on_body_entered(body):
	if body.name == "player":  
		snow_collected.emit()
		game_manager.add_point()
	
		queue_free()  
