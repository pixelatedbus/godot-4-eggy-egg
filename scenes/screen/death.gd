extends Area2D

@onready var scores_and_stuff = $"../../../scores and stuff"
@onready var thang = $"../../../game over/thang"

# Called when the node enters the scene tree for the first time.



func _on_body_entered(body):
	if body.name == "egg":
		scores_and_stuff.menu.visible = false
		thang.visible = true
		print("wow")
		await get_tree().create_timer(10).timeout
		body.queue_free()
		
	if body.name == "bird":
		body.queue_free()
	
	if body.name == "koin":
		body.queue_free()
