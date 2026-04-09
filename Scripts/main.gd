extends Node2D
var wait_time = .5

# Called when the node enters the scene tree for the first time.
func _ready():
	#var timer = Timer.new()
	#timer.wait_time = wait_time
	#add_child(timer)
	%GameOver.hide()
	%DropTimer.timeout.connect(_on_timer_timeout)
	%DropTimer.start()

	
func _on_timer_timeout():
	randomize()
	var choice = randf_range(1,100)
	var droplet
	if(choice < 70):
		droplet = preload("res://Scenes/sugar.tscn").instantiate()
	else:
		droplet = preload("res://Scenes/enemy.tscn").instantiate()
	droplet.position.y = -25
	droplet.position.x = randf_range(100, 1000)
	wait_time = randf_range(.1,1)
	add_child(droplet)
	print(wait_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%DropTimer.wait_time = wait_time
	pass

func on_game_over():
	%GameOver.show()
