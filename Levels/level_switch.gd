extends Control
class_name LevelSwitcher
@export var Fade_Switch : String = "Fade Out"
@export var Load_Level : PackedScene

@onready var Hidden_Fade : TextureRect = $Fade
@onready var start_fade : AnimationPlayer = $Fading

func _ready():
	Hidden_Fade.visible = false

func start_switch(fade_out : bool):
	if(fade_out):
		start_fade.queue("Fade Out")
	else:
		start_fade.queue("Fade In")
	


func _on_fading_animation_finished(anim_name):
	if (Load_Level != null and anim_name == Fade_Switch):
		get_tree().change_scene_to_packed(Load_Level)
