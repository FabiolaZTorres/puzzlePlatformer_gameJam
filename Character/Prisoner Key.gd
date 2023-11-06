extends Node2D

class_name Prisoner_Key

@export var key : bool = false

func get_key():
	key = true
	
func have_key():
	return key
	
