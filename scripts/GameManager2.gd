extends Node
@onready var score_label = $ScoreLabel

var score = 0 
func  add_point():
	score += 1
	score_label.text = "You collected " + str(score) + "coins." 
	

func _transition_to_next_level() -> void:

	print("Loading scene: ")  
	get_tree().change_scene_to_file("res://scenes/game3.tscn")  
