extends CharacterBody2D


@export var speed: float = 100.0

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("MoveRight"):
		$AnimatedSprite2D.play("Right")
		velocity.x += 1

	if Input.is_action_pressed("MoveLeft"):
		$AnimatedSprite2D.play("Left")
		velocity.x -= 1
	if Input.is_action_pressed("MoveDown"):
		$AnimatedSprite2D.play("Down")
		velocity.y += 1
	if Input.is_action_pressed("MoveUp"):
		$AnimatedSprite2D.play("Up")
		velocity.y -= 1

	velocity = velocity.normalized() * speed
