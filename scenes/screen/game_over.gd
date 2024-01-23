extends Control

@onready var point = $thang/point
@onready var main = $".."
var money
@onready var button_press = $"button press"
@onready var fail_with_crack = $"fail with crack"
@onready var coin = $thang/coin


func _on_retry_pressed():
	button_press.play()
	Global.music = main.bg_music.get_playback_position()
	main.bg_music.stop()
	get_tree().reload_current_scene() # Replace with function body.


func _on_go_back_pressed():
	button_press.play()
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn") # Replace with function body.
	
func _process(_delta):
	point.text = str(main.points) + " Points!"
	coin.text = str(main.coins) + " Coins earned!"

func _on_thang_visibility_changed():
	fail_with_crack.play()
	main.bg_music.volume_db = -15
	Global.latest_score = main.points
	if main.points > Global.high_score:
		Global.high_score = main.points
