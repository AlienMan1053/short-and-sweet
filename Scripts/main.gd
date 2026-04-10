extends Node2D
var wait_time = .5

# Called when the node enters the scene tree for the first time.
func _ready():
	#var timer = Timer.new()
	#timer.wait_time = wait_time
	#add_child(timer)
	GameManager._state = GameManager.GAME_STATES.MENU
	GameManager.tongue_health = 5
	GameManager.player_size = .25
	%GameOver.hide()
	%StartMenu.show()
	%DropTimer.timeout.connect(_on_timer_timeout)
	%DropTimer.start()

	
func _on_timer_timeout():
	match GameManager._state:
		GameManager.GAME_STATES.PLAYING:
			randomize()
			var choice = randf_range(1,100)
			var droplet
			if(choice < 60):
				droplet = preload("res://Scenes/sugar.tscn").instantiate()
			elif(choice < 80):
				droplet = preload("res://Scenes/enemy.tscn").instantiate()
			else:
				droplet = preload("res://Scenes/water.tscn").instantiate()
			droplet.position.y = -25
			droplet.position.x = randf_range(100, 1000)
			wait_time = randf_range(.1,1)
			add_child(droplet)
			print(wait_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%DropTimer.wait_time = wait_time
	match GameManager._state:
		GameManager.GAME_STATES.GAME_OVER:
			%GameOver
			%GameOver.show()
	pass



func _on_start_menu_start_game() -> void:
	%StartMenu.hide()
	GameManager._state = GameManager.GAME_STATES.PLAYING # Replace with function body.


func _on_start_menu_exit_game() -> void:
	print("exit")
	get_tree().quit()
