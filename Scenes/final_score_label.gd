extends Label
func _process(delta: float) -> void:
	text = "Final Score: " + str(GameManager.final_score)
	
