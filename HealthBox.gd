class_name HealthBox extends InjuryTracker
#In progress health
@export var hp : float = 1

func on_hit(injury : float):
	super(injury)

func get_hp():
	return hp

func set_hp(health):
	hp = health
