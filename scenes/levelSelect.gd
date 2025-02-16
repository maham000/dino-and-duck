extends Node2D

func _ready():
	pass 

func _process(delta):
	pass


func _on_lvl_1_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_lvl_2_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/game2.tscn")


func _on_lvl_3_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/game3.tscn")


func _on_back_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/startScene.tscn")
