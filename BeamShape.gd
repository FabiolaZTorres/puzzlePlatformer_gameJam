extends Sprite2D
#Ignore, old weapon aim

var Beam : Node2D


func _ready():
	Beam = get_parent()



func _process(delta):
	if cos(deg_to_rad(Beam.rotation_degrees))<0.0:
		scale.y = -1* abs(scale.y)
	else:
		scale.y = 1*abs(scale.y)
