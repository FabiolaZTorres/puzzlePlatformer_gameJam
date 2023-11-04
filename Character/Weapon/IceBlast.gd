extends Area2D

@export var damage : int = 1

#Projectile movement broke slightly needs some adjustment
var speed = 300
var Rotation_speed =15
var movable = true

func _ready():
	$AnimatedSprite2D.play("Breath of the Old Ones")
	speed = 300
	Rotation_speed = 15

func physics_process(delta):
	if movable == true:
		position.x += speed * delta
	
	
	rotate(deg_to_rad(15))

#Possibly Replace with connect to "Enemy"
#Checks if weapon collision makes contact with another body. needs work.
func _on_body_entered(body):
	for child in body.get_children():
		if child is Damaged:
			child
	
	print(body.name)
	
		#removing weapon post use.
func remove():
	await get_tree().create_timer(0.5).timeout
	queue_free()



	pass 
