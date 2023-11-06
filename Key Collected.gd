extends Area2D


func _on_body_entered(body):
	for child in body.get_children():
		if child is Prisoner_Key:
			child.get_key()
			get_parent().queue_free()
