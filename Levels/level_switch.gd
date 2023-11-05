extends Control
class_name LevelSwitcher

@onready var Hidden_Fade : TextureRect = $Fade
@onready var start_fade : AnimationPlayer = $Fading

func _ready():
	Hidden_Fade.visible = false

func start_switch(fade_out : bool):
	if(fade_out):
		start_fade.queue("Fade Out")
	else:
		start_fade.queue("Fade In")
	
