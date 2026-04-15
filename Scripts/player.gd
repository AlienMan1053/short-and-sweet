extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



func _process(delta: float) -> void:
	scale = Vector2(GameManager.player_size, GameManager.player_size)
	change_size()
	if Input.is_action_just_pressed("Pause") and GameManager._state == GameManager.GAME_STATES.PLAYING:
		GameManager.pause()
	elif Input.is_action_just_pressed("Pause") and GameManager._state == GameManager.GAME_STATES.PAUSED:
		GameManager.unpause()

func change_size() -> void:
	if(GameManager.player_size >= 0.25):
		animated_sprite_2d.animation = "idle"
	elif(GameManager.player_size >= 0.225):
		animated_sprite_2d.animation = "orange"
	elif(GameManager.player_size >= 0.2):
		animated_sprite_2d.animation = "yellow"
	elif(GameManager.player_size >= 0.175):
		animated_sprite_2d.animation = "lime"
	elif(GameManager.player_size >= 0.15):
		animated_sprite_2d.animation = "blue"
	elif(GameManager.player_size >= 0.125):
		animated_sprite_2d.animation = "cyan"
	elif(GameManager.player_size >= 0.1):
		animated_sprite_2d.animation = "purple"
	elif(GameManager.player_size >= 0.075):
		animated_sprite_2d.animation = "indigo"

func _physics_process(delta: float) -> void:
	if GameManager._state == GameManager.GAME_STATES.PLAYING:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			GameManager.jump()
			velocity.y = GameManager.player_jump_velocity
			var shrink_chance = randf_range(1,100)
			if(GameManager.player_size >= .1 && shrink_chance > 80):
				GameManager.set_size(-.025)
				GameManager.crunch()

		# Get the input direction and handle the movement/deceleration.
		var direction := Input.get_axis("Left", "Right")
		if direction:
			velocity.x = direction * GameManager.player_speed
		else:
			velocity.x = move_toward(velocity.x, 0, GameManager.player_speed)

		move_and_slide()
		
		animated_sprite_2d.animation = "idle"
		
		if direction == 1.0:
			animated_sprite_2d.rotation += 0.1
			%Filth_1.rotation += 0.1
			%Filth_2.rotation += 0.1
			%Filth_3.rotation += 0.1
		if direction == -1.0:
			animated_sprite_2d.rotation -= 0.1
			%Filth_1.rotation -= 0.1
			%Filth_2.rotation -= 0.1
			%Filth_3.rotation -= 0.1
