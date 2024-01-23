extends Node2D

#@onready var latest_score = $latest_score
@onready var main = $".."
@onready var mainmenu = get_node("/root/MainMenu")
@onready var gameover = $"."
#@onready var scoremanager = preload("res://scenes/screen/scores_and_stuff.gd")
@onready var mumsic = $mumsic


func _on_play_pressed():
	Global.music_menu = mumsic.get_playback_position()
	get_tree().change_scene_to_file("res://scenes/real_main.tscn")
	mainmenu.visible = false

func _on_howto_play_pressed():
	Global.music_menu = mumsic.get_playback_position()
	get_tree().change_scene_to_file("res://scenes/menus/howtoplay.tscn")
	mainmenu.visible = false

func _on_shop_pressed():
	Global.music_menu = mumsic.get_playback_position()
	get_tree().change_scene_to_file("res://scenes/menus/shop.tscn")


func _on_quit_pressed():
	get_tree().quit()



func _on_cutscene_pressed():
	get_tree().change_scene_to_file("res://cutscene.tscn")

func update_score():
	#highest.text = "High Score: " + str(scoremanager.high_score)
	#latest.text = "Latest Score: " + str(scoremanager.latest_score)
	pass

func _on_save_pressed():
	pass
	#if latest_score > SaveLoad.highest_score:
		#SaveLoad.highest_scoore = latest_score
		#highest.text = str(latest_score)
	#SaveLoad.save()
	#
	#SaveLo

 # Replace with function body.
