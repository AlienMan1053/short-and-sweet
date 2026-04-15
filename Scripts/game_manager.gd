extends Node
#Displayed game information
signal score_changed(new_score)
signal combo_changed(new_combo)
signal health_changed(new_health)

#Score trackers
var score = 0
var comboMultipier = 1.0

#Player information
var player_size = 0.25
var filth_value = 0

#Player speed values
var player_speed
const SPEED = 750.0
const SPEED_DEBUFF = 110.0
const SPEED_BUFF = 80.0

#Player jump values
var player_jump_velocity
const JUMP_VELOCITY = -600.0
const JUMP_DEBUFF = SPEED_DEBUFF + 5.0
const JUMP_BUFF = SPEED_BUFF + 5.0

#Sound and world variables
var tongue_health = 5
var audio = preload("res://Scenes/sounds.tscn").instantiate()

enum GAME_STATES {
	MENU,
	PLAYING,
	GAME_OVER,
	PAUSED
}
var _state: GAME_STATES = GAME_STATES.MENU

func _ready() -> void:
	add_child(audio)
	player_speed = SPEED
	player_jump_velocity = JUMP_VELOCITY

func add_point(droplet):
	if(droplet == "water"):
		score += 3*comboMultipier
	elif(droplet == "sugar"):
		score += 10*comboMultipier
		if comboMultipier < 5:
			comboMultipier += .1
	else:
		score += 12*comboMultipier
	
	emit_signal("score_changed",score)
	emit_signal("combo_changed",comboMultipier)
	#print(score)

func remove_point():
	var gross_sound = randf_range(1,3)
	#print("GROSS: ", gross_sound)
	if(gross_sound <= 1):
		audio.get_node("gross_1").play()
	elif(gross_sound <= 2):
		audio.get_node("gross_2").play()
	elif(gross_sound <= 3):
		audio.get_node("gross_3").play()
	comboMultipier = 1.0
	score -= 10*comboMultipier
	tongue_health -= 1
	if tongue_health == 0:
		gameover()
		_state = GAME_STATES.GAME_OVER
	
	emit_signal("health_changed", tongue_health)
	emit_signal("score_changed",score)
	emit_signal("combo_changed",comboMultipier)
	#print(score)
	
func set_size(size_change):
	player_size += size_change
	print("FILTH: ", filth_value)
	print("SIZE: ", player_size)
	print("JUMP: ", player_jump_velocity)
	print("SPEED: ", player_speed)
	print("")
	#print("New Size: ", player_size)

func pause():
	_state = GAME_STATES.PAUSED

func unpause():
	_state = GAME_STATES.PLAYING

func filthy(added_filth):
	filth_value += added_filth
	#print("Filth level: ", GameManager.filth_value)
	for num in range(0,4):
		if(filth_value == num):
			player_speed = SPEED + (num * SPEED_BUFF) - (num * SPEED_DEBUFF)
			player_jump_velocity = JUMP_VELOCITY - (num * SPEED_BUFF) + (num * JUMP_DEBUFF)

func squelch():
	audio.get_node("squelch").play()

func jump():
	audio.get_node("jump").play()
func yum():
	var yum_sound = randf_range(1,5)
	if(yum_sound <= 2):
		audio.get_node("mmm_1").play()
	elif(yum_sound <= 3):
		audio.get_node("mmm_2").play()
func lick():
	var lick_sound = randf_range(1,6)
	if lick_sound <= 1:
		audio.get_node("lick_1").play()
	if lick_sound <= 2:
		audio.get_node("lick_2").play()
	if lick_sound <= 3:
		audio.get_node("lick_3").play()

func crunch():
	audio.get_node("crunch_1").play()

func block():
	var block_sound = randf_range(1,4)
	if block_sound <= 1:
		audio.get_node("block_1").play()
	if block_sound <= 2:
		audio.get_node("block_2").play()

func heal():
	audio.get_node("sugar").play()

func start_music():
	audio.get_node("music").play()

func game_start():
	audio.get_node("game_start").play()

func gameover():
	audio.get_node("music").stop()
	audio.get_node("gameover").play()

func reset():
	score = 0
	comboMultipier = 1.0
	player_size = 0.25
	filth_value = 0
	tongue_health = 5

func _on_button_pressed() -> void:
	%GameOver.hide()
	get_tree().reload_current_scene()
