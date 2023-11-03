extends Node2D
#In progress taken damage/death code
class_name Damaged

@export var health: float = 1


func chopped(damage : int):
	health -= damage
	
	if (health <= 0):
		get_parent().queue_free()
