extends Node
signal score_changed(new_score)
signal combo_changed(new_combo)
var score = 0
var comboMultipier = 1.0

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
	
