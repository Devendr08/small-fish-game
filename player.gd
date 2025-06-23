extends CharacterBody2D

@export var speed = 600  # speed in pixels/sec
var acceleration = 100
var deceleration = 50

@onready var sprite = $playerimage  # correct name now!

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")

	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * speed, acceleration * delta)

		# Flip left/right based on horizontal movement
		if direction.x != 0:
			sprite.flip_h = direction.x < 0
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)

	move_and_slide()
