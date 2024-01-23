extends Label

func _process(_delta):
	text = "Latest Score: " + str(Global.latest_score)
