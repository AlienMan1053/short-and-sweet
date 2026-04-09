extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.wait_time = 1.7
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	
func _on_timer_timeout():
	randomize()
	var droplet = preload("res://Scenes/droplet.tscn").instantiate()
	droplet.position.y = -25
	droplet.position.x = randf_range(100, 1000)
	add_child(droplet)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
