extends Area2D
@onready var game_manager = get_node("/root/GameManager")  

@onready var timer = $Timer

func _on_body_entered(body):
	print("Collision with body: ", body.name)


	if body.is_in_group("player2"):
		if game_manager.snow_coins_collected > 0:

			print("Duck has snow! Removing Cougar.")
			queue_free()  
		else:

			print("Duck has no snow! Duck dies.")
			body.queue_free()  


	elif body.is_in_group("player"):  
		print("Dino hit the Cougar! Dino dies.")
		body.queue_free()  

	Engine.time_scale = 0.5
	timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1  
	get_tree().reload_current_scene()  
