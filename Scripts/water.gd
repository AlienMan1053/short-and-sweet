extends "res://Scripts/droplet.gd"

"""
Extended the droplet class to add particular logic to the enemy scene.
"""

func _on_body_entered(body) -> void:
	if(body.name == "Player"):
		if GameManager.player_size >= .1:
			GameManager.set_size(-.025)
	queue_free()
