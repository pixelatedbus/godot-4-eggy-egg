extends Node2D

@onready var right_x_pos = $"right/right x pos"
@onready var left_x_pos = $"left/left x pos"

# LEFT AMA RIGHT KEBALIK ANJIR
func _on_right_body_entered(body):
	if body.name == "egg" :
		body.global_position.x = right_x_pos.global_position.x - 25
		print(body.global_position)

func _on_left_body_entered(body):
	if body.name == "egg" :
		body.global_position.x = left_x_pos.global_position.x + 25
		print(body.global_position)
