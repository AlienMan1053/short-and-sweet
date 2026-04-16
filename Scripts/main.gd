extends Node2D
var wait_time = .5

# Called when the node enters the scene tree for the first time.
func _ready():
	#var timer = Timer.new()
	#timer.wait_time = wait_time
	#add_child(timer)
	GameManager._state = GameManager.GAME_STATES.MENU
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
			var sugar_chance = 20.0
			var water_chance = 8.0
			if(choice < 10*(GameManager.comboMultipier - 1)):
				droplet = preload("res://Scenes/soda.tscn").instantiate()
			elif(choice < (6-GameManager.comboMultipier) * water_chance):
				droplet = preload("res://Scenes/water.tscn").instantiate()
			elif(choice < (6-GameManager.comboMultipier) * sugar_chance):
				droplet = preload("res://Scenes/sugar.tscn").instantiate()
			else:
				droplet = preload("res://Scenes/enemy.tscn").instantiate()
			droplet.position.y = -25
			droplet.position.x = randf_range(100, 1000)
			wait_time = randf_range(.1,1)
			add_child(droplet)
			#print(wait_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%DropTimer.wait_time = wait_time
	match GameManager._state:
		GameManager.GAME_STATES.GAME_OVER:
			%GameOver.show()
	pass

func on_game_over():
	%GameOver.show()


func _on_start_menu_start_game() -> void:
	%StartMenu.hide()
	GameManager._state = GameManager.GAME_STATES.PLAYING # Replace with function body.


func _on_start_menu_exit_game() -> void:
	print("exit")
	get_tree().quit()
