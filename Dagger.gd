extends Area2D


var direction : Vector2 = Vector2.RIGHT
@export var speed = 100

func _process(delta):
	global_position += direction * speed * delta
	$AnimatedSprite2D.play("Icedagger")

func _on_screen_exited():
	queue_free()
