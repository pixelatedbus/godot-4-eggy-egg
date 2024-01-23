extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.skin == 1:
		visible = true
	else:
		visible = false
