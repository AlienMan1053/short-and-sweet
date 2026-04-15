extends "res://Scripts/droplet.gd"

"""
Extended the droplet class to add particular logic to the enemy scene.
"""
func _on_body_entered(body) -> void:
	if(body.name == "Tongue"):
		GameManager.yum()
		GameManager.add_point("sugar")
		queue_free()
	if(body.name == "Player"):
		if(GameManager.player_size<.25 && GameManager.filth_value == 0):
			GameManager.set_size(.025)
			GameManager.heal()
			queue_free()
