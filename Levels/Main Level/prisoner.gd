extends CharacterBody2D

@export var Objective_complete : bool = true
@export var levelswitch : LevelSwitcher
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _ready():
	$Objective.hide()



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta



func _on_celia_arrives_body_entered(body):
	for child in body.get_children():
		if child is Prisoner_Key and child.have_key():
			$AnimatedSprite2D.play("Prison Break")
			$Objective.show()
