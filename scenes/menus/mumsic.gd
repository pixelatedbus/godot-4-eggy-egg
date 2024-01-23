extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	play(Global.music_menu)


func _on_finished():
	play() # Replace with function body.
