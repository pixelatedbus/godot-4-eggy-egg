extends AudioStreamPlayer


func _on_finished():
	play() # Replace with function body.

func _process(_delta):
	if Global.pause:
		stream_paused = true
	else:
		stream_paused = false
