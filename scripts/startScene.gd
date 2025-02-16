extends Node2D


func _ready():
	pass 



func _process(delta):
	pass



func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/cutscene1.tscn")


func _on_player_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/levelSelect.tscn")
