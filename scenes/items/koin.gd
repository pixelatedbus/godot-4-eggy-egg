extends Area2D
@onready var main = $".."
@onready var koin = $"."
@onready var koin_noises = $"koin noises"
@onready var collect = $collect

func _physics_process(_delta):
	if !Global.pause:
		position.y += 5
		rotation += 0.05

func _on_area_entered(area):
	if area.name == "koin": # Replace with function body.
		collect.global_position = Vector2.ZERO
		create_tween().tween_property(koin, "modulate", Color(10, 10, 10, 0), 0.3)
		Global.koin += 1
		main.coins += 1
		koin_noises.play()
		await get_tree().create_timer(0.3).timeout
		koin.queue_free()
