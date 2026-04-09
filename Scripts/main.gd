extends Node2D

@export var point_1: Vector2 = Vector2(80,0)
@export var point_2: Vector2 = Vector2(1050,0)

@onready var powerup_blueprint: Resource = preload("res://Scenes/sugar.tscn")

func get_random_point(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)
	
	var random_point: Vector2 = Vector2(x_value, y_value)
	
	return random_point

func spawn_powerup():
	var powerup_instance: Node = powerup_blueprint.instantiate()
	powerup_instance.scale = Vector2(0.5, 0.5)
	add_child(powerup_instance)
	
	var spawn_location: Vector2 = get_random_point(point_1, point_2)
	powerup_instance.set_position(spawn_location)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Spawn"):
		spawn_powerup()
