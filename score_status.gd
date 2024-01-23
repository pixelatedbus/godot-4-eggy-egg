extends Node

const SAVEFILE = "user://savefile.save"

var highest_rec = 0

func _ready():
	load_score()
	
func saved_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE_READ)
	file.store_32(highest_rec)
	


func load_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.READ)
	if FileAccess.file_exists(SAVEFILE):
		highest_rec = file.get_32()
