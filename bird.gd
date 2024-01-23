extends Area2D
@onready var bird_pic = $"bird pic"
@onready var main = $".."
@onready var noises = $noises
@onready var egg = $"../egg"

var speed = 0
var right = true

func _ready():
	speed = 10 * randf_range(0.5, 1.5)
	noises.play()

func _on_body_entered(body):
	if body.name == "egg":
		body.velocity = Vector2.ZERO
		
func _physics_process(_delta):
	if !Global.pause:
		if right:
			bird_pic.flip_h = false
			position.x += speed
		else:
			bird_pic.flip_h = true
			position.x -= speed
			
		if (global_position.x < main.left_x_pos.global_position.x + 25) or (global_position.x > main.right_x_pos.global_position.x - 25):
			right = !right 

		

