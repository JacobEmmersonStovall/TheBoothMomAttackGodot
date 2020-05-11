extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	if velocity.x == 0 and velocity.y == 0:
		$AnimatedSprite.play("Idle")
	else:
		$AnimatedSprite.play("Running")

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	for i in range(get_slide_count() - 1):
		var collision = get_slide_collision(i)
		if "Mom" in collision.collider.name:
			get_tree().get_root().get_node("World")._on_game_over()

