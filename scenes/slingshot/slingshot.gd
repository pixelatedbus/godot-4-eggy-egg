extends Node2D

var launchable = false
@onready var egg = $"../egg"
@onready var pull_area = $"pull area"
var gravity1 = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var camera_2d = $"../Camera2D"
@onready var main = $".."
@onready var myself = $"."
@onready var pull = $pull
@onready var release = $release
@onready var landing = $landing
@onready var time_limit = $time_limit
@onready var right_rope = $"right rope"
@onready var left_rope = $"left rope"
@onready var tanah_2 = $Tanah2


var arrow = preload("res://scenes/arrow.tscn")
var instance = arrow.instantiate()

func _on_pull_area_body_entered(body): # pas egg masuk daerah
	if body.name == "egg":
		stop_it(body)
		landing.play()
		launchable = true
		add_child(instance)
		instance.global_position = global_position
		instance.modulate = Color(0, 0, 0, 0)
		create_tween().tween_property(camera_2d, "position", Vector2(960,global_position.y), 0.2)
		create_tween().tween_property(myself, "modulate", Color(2, 0, 0, 0.5), 5)
		main.inst(global_position)
		main.instance(global_position)
		main.points += 1
		time_limit.start()
		right_rope.add_point(Vector2.ZERO)
		left_rope.add_point(Vector2.ZERO)
		

func stop_it(object) -> void: # ini ngefreeze
	if "velocity" in object:
		object.velocity = Vector2.ZERO
		var moving = create_tween()
		moving.tween_property(object, "position", global_position, 0.1)

func disappear(object) -> void: #buat ngilang
	var disappearing = create_tween()
	disappearing.tween_property(object, "modulate", Color(0, 0, 0, 0), 0.3)
	await get_tree().create_timer(0.3).timeout
	object.queue_free()

func _process(_delta):
	if launchable == true:
		egg.velocity = Vector2.ZERO
		egg.gravity = 0
		main.launchable = true
		
		
		if Input.is_action_pressed("click") and !Global.pause:
			egg.position = (get_local_mouse_position().limit_length(100) + global_position)
			instance.visible = true
			create_tween().tween_property(instance, "modulate", Color(1, 1, 1, 1), 0.1)
			pull_area.monitoring = false
			right_rope.set_point_position(1, get_local_mouse_position().limit_length(100))
			left_rope.set_point_position(1, get_local_mouse_position().limit_length(100))
			
		if Input.is_action_just_pressed("click"):
					pull.play()
					
		if Input.is_action_just_released("click") and (get_local_mouse_position().length() > 10) and !Global.pause:
			egg.velocity = ((global_position - egg.global_position)*14)
			release.play()
			pull.stop()
			egg.gravity = gravity1
			launchable = false
			main.launchable = false
			await get_tree().create_timer(0.01).timeout
			instance.queue_free()
			disappear(myself)

func _on_time_limit_timeout():
	launchable = false
	main.launchable = false
	egg.gravity = gravity1
	release.play()
	disappear(myself) # Replace with function body.
