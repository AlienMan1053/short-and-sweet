extends Node
signal score_changed(new_score)
signal combo_changed(new_combo)
var score = 0
var comboMultipier = 1.0
var player_size = 0.25
var filth_value
var tongue_health
var final_score

enum GAME_STATES {
	MENU,
	PLAYING,
	GAME_OVER
}
var _state: GAME_STATES = GAME_STATES.MENU

func add_point():
	score += 10*comboMultipier
	if comboMultipier < 5:
		comboMultipier += .1
	
	emit_signal("score_changed",score)
	emit_signal("combo_changed",comboMultipier)
	print(score)

func remove_point():
	comboMultipier = 1.0
	score -= 10*comboMultipier	
	tongue_health -= 1
	if tongue_health == 0:
		final_score = score
		_state = GAME_STATES.GAME_OVER
	
	emit_signal("score_changed",score)
	emit_signal("combo_changed",comboMultipier)
	print(score)
	
func set_size(size_change):
	player_size += size_change
	print("New Size: ", player_size)

func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
