extends "res://droplet.gd"

"""
Extended the droplet class to add particular logic to the enemy scene.
"""
func _on_body_entered(body) -> void:
	if(body.name == "Tongue"):
		GameManager.add_point()
	queue_free()
