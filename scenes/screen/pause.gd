extends Control
@onready var pausemenu = $pausemenu
var open = true
@onready var real_main = $".."


func _on_main_menu_pressed():
	real_main.pauseMenu()
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
	 # Replace with function body.


func _on_restart_pressed():
	real_main.pauseMenu()
	get_tree().reload_current_scene()
	 # Replace with function body.


func _on_continue_pressed():
	real_main.pauseMenu()


func _on_visibility_changed():
	pausemenu.visible = open
	open = !open # Replace with function body.
