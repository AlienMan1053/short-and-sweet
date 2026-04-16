extends "res://Scripts/droplet.gd"

"""
Extended the droplet class to add particular logic to the enemy scene.
"""

func _on_body_entered(body) -> void:
	if(body.name == "Tongue"):
		AudioManager.lick_sound()
		GameManager.add_point("soda")
	if(body.name == "Player"):
		AudioManager.squelch_sound()
		GameManager.buff()
		if(GameManager.player_size >= .125):
			GameManager.set_size(-.05)
		if(GameManager.filth_value < 4):
			GameManager.filthy(1)
	queue_free()
