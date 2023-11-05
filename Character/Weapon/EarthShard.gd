extends Area2D

@export var damage : int = 1
@export var speed = 300


func _ready():
	$AnimatedSprite2D.play("Rage of the Ancients")
	speed = 300
	
#Projectile movement 
func _process(delta):
	
		position.x +=  speed * delta

#Checks if earth_shard collision mask 4 makes contact with the breakable_wall colision layer 4 and lowers the breakable_wall health.
func _on_body_entered(body):
	for child in body.get_children():
		if child is Damaged:
			child.attacked(damage)
	
	print(body.name)

#removing weapon post use.
func _on_screen_exited():
	self.queue_free()







