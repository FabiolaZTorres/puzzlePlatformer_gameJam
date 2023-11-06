extends Area2D

@export var damage : int = 1
@export var speed = 300


func _ready():
	$AnimatedSprite2D.play("Breath of the Old Ones")
	speed = 300
	
#Projectile movement 
func _process(delta):
	
		position.x +=  speed * delta

#Checks if ice_blast collision mask 2 makes contact with the Enemy colision layer 2 and lowers the Enemy health.
func _on_body_entered(body):
	for child in body.get_children():
		if child is Damaged:
			child.attacked(damage)
	
	print(body.name)

#removing weapon post use.
func _on_screen_exited():
	self.queue_free()







