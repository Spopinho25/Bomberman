extends CharacterBody2D


@export var speed: float = 100.0

func _process(delta: float) -> void: 
	velocity = Vector2.ZERO

	if Input.is_action_pressed("P2MoveRight"):
		$AnimatedSprite2D.play("Right")
		velocity.x += 1

	if Input.is_action_pressed("P2MoveLeft"):
		$AnimatedSprite2D.play("Left")
		velocity.x -= 1
	if Input.is_action_pressed("P2MoveDown"):
		$AnimatedSprite2D.play("Down")
		velocity.y += 1
	if Input.is_action_pressed("P2MoveUp"):
		$AnimatedSprite2D.play("Up")
		velocity.y -= 1
		
	if velocity.length() == 0:
		$AnimatedSprite2D.frame = 1 
		$AnimatedSprite2D.pause()
	velocity = velocity.normalized() * speed

	move_and_slide()
