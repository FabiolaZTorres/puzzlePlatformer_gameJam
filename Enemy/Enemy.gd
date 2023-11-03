extends CharacterBody2D


@export var movement_pace = 20.0
@export var movement_direction : Vector2 = Vector2.LEFT

#const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle the enemy movement.

	var direction : Vector2 = movement_direction
	if direction:
		velocity.x = direction.x * movement_pace
	else:
		velocity.x = move_toward(velocity.x, 0, movement_pace)

	move_and_slide()
