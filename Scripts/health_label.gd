extends Label

func _ready():
	GameManager.health_changed.connect(_on_health_changed)
	
func _on_health_changed(new_health):
	text = str(new_health)
	
	
