extends CharacterBody2D

@export var damage : int = 1
@export var movement_pace = 20.0
@export var Jump_speed = -200.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var movement_direction : Vector2 = Vector2.RIGHT
	


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	#checks if Enemy has collided with a wall and changes their direction to the opposite direction.
	elif (is_on_wall()):
		movement_direction *= -1
	else:
		jump()

	

	# Handles the Enemy movement.
	if movement_direction:
		velocity.x = movement_direction.x * movement_pace
	else:
		velocity.x = move_toward(velocity.x, 0, movement_pace)

	move_and_slide()
	
#Gives the Enemy the ability to jump
func  jump():
	velocity.y += Jump_speed






#Checks if the Enemy collision mask 3 makes contact with Celia's collision layer 3 and lowers her health.
func _on_player_attack_body_entered(body):
	for child in body.get_children():
		if child is Damaged:
			child.attacked(damage)
			get_tree().reload_current_scene()
			
	print(body.name)
