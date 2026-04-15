extends "res://Scripts/droplet.gd"

"""
Extended the droplet class to add particular logic to the enemy scene.
"""

func _on_body_entered(body) -> void:
	if(body.name == "Tongue"):
		GameManager.remove_point()
	if(body.name == "Player"):
		GameManager.block()
		GameManager.add_point("enemy")
		if(GameManager.filth_value < 3):
			GameManager.filthy(1)
	queue_free()
