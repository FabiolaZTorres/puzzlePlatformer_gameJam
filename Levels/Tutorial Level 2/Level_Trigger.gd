extends CheckButton

@export var levelswitch : LevelSwitcher




func _on_toggled(button_pressed):
	levelswitch.start_switch(button_pressed)
