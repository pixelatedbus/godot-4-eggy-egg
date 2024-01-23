extends Area2D
@onready var egg = $".."
@onready var sprite = $"Pngtree-circle-clipart-blue-circle-png-image2381949-removebg-preview"

func _process(_delta):
	scale = Vector2(egg.int_scale, egg.int_scale)
	if egg.int_scale > 1:
		sprite.visible = true
		
	else:
		sprite.visible = false
