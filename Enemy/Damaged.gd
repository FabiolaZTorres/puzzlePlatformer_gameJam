extends Node2D

#Damage/Death Script
class_name Damaged

@export var health: float = 1

#Reduces a characters health, checks if their health has reached 0 and eliminates them from the scene
func attacked(damage : int):
	health -= damage
	
	if (health <= 0):
		get_parent().queue_free()
