class_name Beam extends Node2D
#Ignore this, old weapon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var aim = get_global_mouse_position()

	look_at(aim)
