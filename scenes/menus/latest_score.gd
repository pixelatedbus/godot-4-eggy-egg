extends Label

func _process(_delta):
	text = "High Score: " + str(Global.high_score)
