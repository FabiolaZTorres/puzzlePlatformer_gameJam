extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	var Hearts = Image.new()
	var HeartsLoad = Hearts.load("res://Character/Arcane Heart.png")
	if HeartsLoad == OK:
		var HP = ImageTexture.new()
		HP.create_from_image(Hearts)
		add_image(HP)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
