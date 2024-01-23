extends Node2D
@onready var bg_music = $"bg music"

var hover = load("res://asset/new folder2/normal.png")
var gyatt = load("res://asset/new folder2/grab.png")
@onready var pause_menu = $pause

var paused = false

func _ready():
	Input.set_custom_mouse_cursor(hover)
	
	Input.set_custom_mouse_cursor(gyatt, Input.CURSOR_DRAG)
	
func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
		Global.pause = false
	else:
		pause_menu.show()
		Engine.time_scale = 0
		Global.pause = true
	
	paused = !paused
