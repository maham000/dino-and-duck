extends Node

@onready var camera1 = $player/CameraP1
@onready var scoreLab = $player/ScoreLabel
@onready var scoreLab2 = $player2/ScoreLabel
@onready var camera2 = $player2/CameraP2
@onready var tween = get_tree().create_tween()  
@onready var is_target_met = false  
var snow_ducks_made = 0  
var snow_coins_collected = 0  
var target_snow_ducks = 3  
@onready var is_in_final_scene = false  
var current_camera = null

func _ready():

	current_camera = camera1
	camera1.make_current()
	is_in_final_scene = false
func minus_point():
	snow_coins_collected -= 3
	update_score_labels()

func add_point():
	snow_coins_collected += 1
	update_score_labels()

func make_snow_duck():
	snow_ducks_made += 1  
	update_score_labels()  

func _transition_to_next_level() -> void:
	print("Loading scene...")
	get_tree().change_scene_to_file("res://scenes/cutscene3.tscn")

func update_score_labels():
	scoreLab.text = "Snow: " + str(snow_coins_collected) + "\nDucks: " + str(snow_ducks_made)
	scoreLab2.text = "Snow: " + str(snow_coins_collected) + "\nDucks: " + str(snow_ducks_made)
	

	if snow_ducks_made >= target_snow_ducks:
		scoreLab.text = "\nGo find the flag!"
		scoreLab2.text = "\nGo find the flag!"
		is_target_met = true
func smooth_switch(target_camera):
	if current_camera == target_camera:
		return  


	tween.stop()  
	tween = get_tree().create_tween()
	tween.tween_property(current_camera, "position", target_camera.position, 0.5)  
	tween.tween_property(current_camera, "zoom", target_camera.zoom, 0.5)  #
	tween.tween_callback(target_camera.make_current)

	current_camera = target_camera  

func _process(delta):

	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right") or Input.is_action_pressed("jump"):
		smooth_switch(camera1)  
		scoreLab.visible_ratio = 1
		scoreLab2.visible_ratio = 0

	elif Input.is_action_pressed("jumpP2") or Input.is_action_pressed("move_rightP2") or Input.is_action_pressed("move_leftP2"):
		smooth_switch(camera2)  
		scoreLab.visible_ratio = 0
		scoreLab2.visible_ratio = 1
	# if want multiplayer can add switch
	if Input.is_action_just_pressed("switch_cam"):
		if current_camera == camera1:
			smooth_switch(camera2)
		else:
			smooth_switch(camera1)
