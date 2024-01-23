extends Node2D

var bird = preload("res://scenes/bird.tscn")
var koin = preload("res://scenes/items/koin.tscn")
var slingshots = preload("res://scenes/slingshot/slingshot.tscn")
var magneto = preload("res://scenes/items/magnet.tscn")
@onready var left_x_pos = $"Camera2D/border/left/left x pos"
@onready var right_x_pos = $"Camera2D/border/right/right x pos"
@onready var coin_making_time = $"coin making time"
@onready var bg_music = $"bg music"

var points = 0
var coins = 0
var launchable = false
var bonus = true

func _ready():
	bg_music.play(Global.music)
	
func _process(_delta):
	if points%10 == 0 and bonus and points != 0:
		coins += 1
		Global.koin += 1
		bonus = false
	elif points%10 == 1:
		bonus = true
	

func inst(pos) -> void:
	var slingy = slingshots.instantiate()
	slingy.modulate = Color(0, 0, 0, 0)
	create_tween().tween_property(slingy, "modulate", Color(1, 1, 1, 1), 0.2)
	await get_tree().create_timer(0.01).timeout
	slingy.global_position.x = randi_range(left_x_pos.position.x+100,right_x_pos.position.x-100)
	slingy.global_position.y = -400*randf_range(0.5, 1.2) + pos.y
	add_child(slingy)

func instance(pos) -> void:
	if (randf() < 0.3):
		var birdy = bird.instantiate()
		birdy.global_position.y = pos.y - 600
		birdy.global_position.x = pos.x
		await get_tree().create_timer(0.01).timeout
		add_child(birdy)
	
	if (randf() < 0.1):
		var magnet = magneto.instantiate()
		magnet.global_position.x = randi_range(left_x_pos.position.x+100,right_x_pos.position.x-100)
		magnet.global_position.y = -700*randf_range(0.5, 1.2) + pos.y
		await get_tree().create_timer(0.01).timeout
		add_child(magnet)



func _on_coin_making_time_timeout():
	if (randf() < 0.7):
		var coin = koin.instantiate()
		coin.global_position.y = left_x_pos.position.y - 400*points
		coin.global_position.x = randi_range(left_x_pos.position.x + 60, right_x_pos.position.x - 60)
		add_child(coin)
	coin_making_time.start()
