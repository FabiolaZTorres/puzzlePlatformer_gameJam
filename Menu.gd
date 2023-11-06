extends Node2D

@export var Load_Level : PackedScene

func _on_play_pressed():
	get_tree().change_scene_to_packed(Load_Level)



func _on_quit_pressed():
	get_tree().quit()
