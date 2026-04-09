extends Area2D

func _ready():
	$Sprite2D.scale = Vector2(0.5, 0.5)
	$CollisionShape2D.scale = Vector2(0.5, 0.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta):
	position.y += 700*delta


func _on_body_entered(body: CharacterBody2D) -> void:
	print("got it")
	queue_free()
