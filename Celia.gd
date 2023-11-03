extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

#Handles positioning Magic on the hand
@onready var Bracelet = $Marker2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var IceBlast = preload("res://ice_blast.tscn");

func _ready():
	InjuryTracker

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	#Handle Magic
	if Input.is_action_just_pressed("Fire"):
		var IceCharge = IceBlast.instantiate()
		IceCharge.position = Bracelet.global_position
		get_tree().current_scene.add_child(IceCharge)
	
	
	# Get the input direction, handle the movement/deceleration and the associated animations.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("Celia Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.stop()

	move_and_slide()
