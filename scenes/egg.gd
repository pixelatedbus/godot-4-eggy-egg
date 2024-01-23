extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var main = $".."
@onready var money_making = $koin/money_making

var int_scale = 1


func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if main.launchable == true:
		money_making.global_position = Vector2.ZERO
	else:
		money_making.position = Vector2.ZERO

	move_and_slide()
