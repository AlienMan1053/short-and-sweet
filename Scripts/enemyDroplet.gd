extends "res://Scripts/droplet.gd"

"""
Extended the droplet class to add particular logic to the enemy scene.
"""

func _on_body_entered(body) -> void:
	if(body.name == "Tongue"):
		GameManager.remove_point()
	if(body.name == "Player"):
		GameManager.set_size(2.0/3.0)
	queue_free()
