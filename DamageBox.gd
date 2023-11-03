extends Area2D
#In progress character damaging code
class_name DamageBox

@export var injury : float = 1

func _ready():
	area_entered.connect(on_hit);



func on_hit(area : Area2D):
	if area is HealthBox:
		area.on_hit(injury)

