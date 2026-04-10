extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 750.0
const JUMP_VELOCITY = -600.0 

func _ready() -> void:
	GameManager.filth_value = 0
	
func _process(delta: float) -> void:
	scale = Vector2(GameManager.player_size, GameManager.player_size)
	if(GameManager.player_size >= 0.25):
		animated_sprite_2d.animation = "idle"
	elif(GameManager.player_size >= 0.225):
		animated_sprite_2d.animation = "orange"
	elif(GameManager.player_size >= 0.2):
		animated_sprite_2d.animation = "yellow"
	elif(GameManager.player_size >= 0.175):
		animated_sprite_2d.animation = "green"
	elif(GameManager.player_size >= 0.15):
		animated_sprite_2d.animation = "blue"
	elif(GameManager.player_size >= 0.125):
		animated_sprite_2d.animation = "pink"
	elif(GameManager.player_size >= 0.1):
		animated_sprite_2d.animation = "purple"
	elif(GameManager.player_size >= 0.075):
		animated_sprite_2d.animation = "indigo"


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	animated_sprite_2d.animation = "idle"
	
	if direction == 1.0:
		animated_sprite_2d.rotation += 0.1
	if direction == -1.0:
		animated_sprite_2d.rotation -= 0.1
