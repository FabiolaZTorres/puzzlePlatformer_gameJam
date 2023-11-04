extends CharacterBody2D


@export var movement_pace = 20.0
@export var Jump_speed = -200.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var movement_direction : Vector2 = Vector2.RIGHT
	


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	elif (is_on_wall()):
		movement_direction *= -1
	else:
		jump()

	

	# Handle the enemy movement.
	if movement_direction:
		velocity.x = movement_direction.x * movement_pace
	else:
		velocity.x = move_toward(velocity.x, 0, movement_pace)

	move_and_slide()
	
func  jump():
	velocity.y += Jump_speed
