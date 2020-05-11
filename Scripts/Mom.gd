extends KinematicBody2D

export (int) var speed = 50
export (int) var speedMultiplier = 1

var velocity = Vector2()

var random_dir_int = 1

var _random = RandomNumberGenerator.new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _increment_speedMultiplier():
	self.speedMultiplier += 1

func _reset_speedMultiplier():
	self.speedMultiplier = 1

func _increment_speed():
	self.speed += 5

func _random_Movement():
	if random_dir_int == 1:
		velocity.x -= 1
		velocity.y -= 1
	if random_dir_int == 2:
		velocity.x += 1
		velocity.y -= 1
	if random_dir_int == 3:
		velocity.x -= 1
		velocity.y += 1
	if random_dir_int == 4:
		velocity.x += 1
		velocity.y += 1
	if random_dir_int == 5:
		velocity.x += 1
	if random_dir_int == 6:
		velocity.x -= 1
	if random_dir_int == 7:
		velocity.y -= 1
	if random_dir_int == 8:
		velocity.y += 1
	velocity = velocity.normalized() * (self.speed * self.speedMultiplier)

func _move_towards_player():
	velocity = Vector2()
	var pos = get_node("/root/World/Player").get_position()
	var momPos = self.get_position()
	if (pos.x +  50 > momPos.x and momPos.x - 50 < pos.x) and (pos.y +  50 > momPos.y and momPos.y - 50 < pos.y):
		_attack_Movement(pos, momPos)
	else:
		_random_Movement()

func _attack_Movement(pos, momPos):
	if pos.x > momPos.x:
		velocity.x += 1
	if pos.x < momPos.x:
		velocity.x -= 1
	if pos.y > momPos.y:
		velocity.y += 1
	if pos.y < momPos.y:
		velocity.y -= 1
	velocity = velocity.normalized() * (self.speed * self.speedMultiplier)

func _handle_animation():
	if velocity.x == 0 and velocity.y == 0:
		$AnimatedSprite.play("Idle")
	else:
		$AnimatedSprite.play("Running")

# Called when the node enters the scene tree for the first time.
func _ready():
	self._random.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	_move_towards_player()
	_handle_animation()
	velocity = move_and_slide(velocity)
	for i in range(get_slide_count() - 1):
		var collision = get_slide_collision(i)
		if "Player" in collision.collider.name:
			get_tree().get_root().get_node("World")._on_game_over()


func _on_ChangeRandomMovementTimer_timeout():
	var num = self._random.randi_range(1,9)
	self.random_dir_int = num
	$ChangeRandomMovementTimer.start(4)
