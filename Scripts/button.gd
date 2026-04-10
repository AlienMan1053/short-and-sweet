extends Button


func _ready():
	var button = Button.new()
	button.text = "Start Over"
	button.pressed.connect(_button_pressed)
	add_child(button)

func _button_pressed():
	get_tree().reload_current_scene()
