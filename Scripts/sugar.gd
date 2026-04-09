extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.scale = Vector2(0.5, 0.5)
	$CollisionShape2D.apply_scale(Vector2(0.5, 0.5))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	$Sprite2D.scale = Vector2(1, 1)
