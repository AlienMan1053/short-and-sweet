extends Node
signal score_changed(new_score)
signal combo_changed(new_combo)
var score = 0
var comboMultipier = 1.0
signal hit
var player_size = 0.25
enum GAME_STATES {
	PLAYING,
	GAME_OVER
}

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
	
	emit_signal("score_changed",score)
	emit_signal("combo_changed",comboMultipier)
	print(score)
	
func set_size(size_change):
	print("you got hit")
	player_size += size_change
	emit_signal("hit", player_size)


func _on_button_pressed() -> void:
	%GameOver.hide()
	get_tree().reload_current_scene()
