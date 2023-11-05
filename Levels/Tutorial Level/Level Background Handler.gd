extends ParallaxBackground


#controls the background movement.
var Background__movementspeed = -0.001

func _process(delta):
	scroll_offset.x -= Background__movementspeed * delta
