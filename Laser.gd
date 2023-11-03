class_name Laser extends Node2D
#Ignore, old weapon 


@export var Laser_scene : PackedScene

@export_group("Effects")
@export var Charge_effects : Array[EmptyEffect]


func _input(event):
	if not event.is_action_pressed("Fire") : return
	if Laser_scene == null: return

	var charge : Node2D = Laser_scene.instantiate() as Node2D
	get_tree().current_scene.add_child(charge)
	charge.global_position = global_position
	charge.global_rotation = get_parent().global_rotation

	for effect in Charge_effects:
		if effect == null: continue
		effect.trigger(self)
