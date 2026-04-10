extends "res://Scripts/droplet.gd"

"""
Extended the droplet class to add particular logic to the enemy scene.
"""

func _on_body_entered(body) -> void:
	if(body.name == "Tongue"):
		GameManager.lick()
	if(body.name == "Player"):
		GameManager.squelch()
		if(GameManager.player_size >= .1 && GameManager.filth_value == 0):
			GameManager.set_size(-.025)
		if(GameManager.filth_value > 0):
			GameManager.filthy(-1)
	queue_free()
