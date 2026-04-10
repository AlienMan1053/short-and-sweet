extends Area2D

func _ready():
	$Sprite2D.scale = Vector2(0.5, 0.5)
	$CollisionShape2D.scale = Vector2(0.5, 0.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(GameManager._state == GameManager.GAME_STATES.GAME_OVER):
		queue_free()
	
func _physics_process(delta):
	position.y += randi_range(200,700)*delta


func _on_body_entered(body) -> void:
	queue_free()
