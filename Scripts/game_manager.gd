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
const MAX_FILTH = 3

#Player DEFAULT_SPEED values
var player_speed
const DEFAULT_SPEED = 750.0
const SPEED_DEBUFF = 60.0
const SPEED_BUFF = 40.0
const MAX_SPEED = DEFAULT_SPEED + (7 * SPEED_BUFF)

#Player jump values
var player_jump_velocity
const DEFAULT_JUMP = -600.0
const JUMP_DEBUFF = SPEED_DEBUFF + 5.0
const JUMP_BUFF = SPEED_BUFF + 5.0

#Sound and world variables
var tongue_health = 5

enum GAME_STATES {
	MENU,
	PLAYING,
	GAME_OVER,
	PAUSED
}
var _state: GAME_STATES = GAME_STATES.MENU

func _ready() -> void:
	player_speed = DEFAULT_SPEED
	player_jump_velocity = DEFAULT_JUMP

func add_point(droplet):
	if(droplet == "water"):
		score += 3*comboMultipier
	elif(droplet == "sugar"):
		score += 9*comboMultipier
		if comboMultipier + .1 < 5:
			comboMultipier += .1
		elif comboMultipier + .1 > 5:
			comboMultipier = 5
	elif(droplet == "enemy"):
		score += 12*comboMultipier
	elif(droplet == "soda"):
		score += 15*comboMultipier
		if comboMultipier + 1 < 5:
			comboMultipier += 1
		elif comboMultipier + 1 > 5:
			comboMultipier = 5
	
	emit_signal("score_changed",score)
	emit_signal("combo_changed",comboMultipier)
	#print(score)

func remove_point():
	AudioManager.gross_sound()
	comboMultipier = 1.0
	score -= 10*comboMultipier
	tongue_health -= 1
	if tongue_health == 0:
		AudioManager.gameover_sound()
		_state = GAME_STATES.GAME_OVER
	
	emit_signal("health_changed", tongue_health)
	emit_signal("score_changed",score)
	emit_signal("combo_changed",comboMultipier)
	#print(score)
func buff():
	if(player_speed + SPEED_BUFF < MAX_SPEED):
		player_speed += SPEED_BUFF
		player_jump_velocity -= SPEED_BUFF
func nerf():
	player_speed -= SPEED_BUFF
	player_jump_velocity += SPEED_BUFF

func set_size(size_change):
	var old_size = player_size
	player_size += size_change
	if(player_size == old_size + 0.025):
		nerf()
	elif(player_size == old_size - 0.025):
		buff()

func pause():
	_state = GAME_STATES.PAUSED

func unpause():
	_state = GAME_STATES.PLAYING

func filthy(added_filth):
	var old_filth = filth_value
	filth_value += added_filth
	#print("Filth level: ", GameManager.filth_value)
	if(filth_value == old_filth + 1):
		nerf()
	elif(filth_value == old_filth - 1):
		buff()

func reset():
	score = 0
	comboMultipier = 1.0
	player_size = 0.25
	filth_value = 0
	tongue_health = 5

func _on_button_pressed() -> void:
	%GameOver.hide()
	get_tree().reload_current_scene()
