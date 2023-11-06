extends CharacterBody2D


@export var hp = 2
const SPEED = 200.0
const JUMP_VELOCITY = -300.0

#Handles positioning Magic on the hand
@onready var Bracelet = $Marker2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var IceBlast = preload("res://Character/Weapon/ice_blast.tscn");
var EarthShard = preload("res://Character/Weapon/earth_shard.tscn");


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handles Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	#Handles Magic
	if Input.is_action_just_pressed("throw_ice"):
		var IceCharge = IceBlast.instantiate()
		IceCharge.position = Bracelet.global_position
		
		get_tree().current_scene.add_child(IceCharge)
	
	if Input.is_action_just_pressed("throw_earth"):
		var EarthCharge = EarthShard.instantiate()
		EarthCharge.position = Bracelet.global_position
		
		get_tree().current_scene.add_child(EarthCharge)
	
	
	# Get the input direction, handle the movement/deceleration and the associated animations.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("Celia Walk")
		$AnimatedSprite2D.flip_h = velocity.x < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.stop()

	move_and_slide()




