extends "res://Scripts/droplet.gd"

"""
Extended the droplet class to add particular logic to the enemy scene.
"""

func _on_body_entered(body) -> void:
	if(body.name == "Tongue"):
		GameManager.remove_point()
	if(body.name == "Player"):
		if(GameManager.filth_value <= 0):
			GameManager.filth_value += 1
	if(GameManager.filth_value < 3):
		queue_free()
	print("Filth level: ", GameManager.filth_value)
