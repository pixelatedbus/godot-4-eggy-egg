extends Node2D
@onready var arrow = $Arrow

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var angle = get_angle_to(get_global_mouse_position())
	rotate(angle)
