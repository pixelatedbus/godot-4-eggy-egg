extends Node

@onready var eggname = $lay/eggname
@onready var use = $lay/use_but
@onready var coin_shop = $lay/bg_coin2/coin_label
@onready var theprice = $lay/bg_coin/coin_label
@onready var mumsic = $mumsic
@onready var yes = $yes
@onready var no = $no
@onready var no_2 = $no2

#@onready var char2 = addres to egg2
var egg  = 1
var egg1p = 0
var egg2p = 10
var price = 0
var egg1owned = true
var egg2owned = false


var eggname_dict = {
	"egg1": "Egg", 
	"egg2": "Easter Egg"
	}

func _ready():
	$lay/eggicon.play("eggno1")
	egg = 1

	
	
func _physics_process(_delta):
	if self.visible == true:
		if egg == 1:
			$lay/eggicon.play("eggno1")
			eggname.text = eggname_dict["egg1"]
			if egg1owned == false:
				use.text = "Purchase"
			elif Global.skin == 0:
				use.text = "Used"
			else:
				use.text = "Use"
		if egg == 2:
			$lay/eggicon.play("eggno2")
			eggname.text = eggname_dict["egg2"]
			if egg2owned == false:
				use.text = "Purchase"
			elif Global.skin == 1:
				use.text = "Used"
			else:
				use.text = "Use"
			
			
func _process(_delta):
	pass
	#if egg1owned == true:
		#$purchase_but.text = "Owned"
	#if egg2owned == true:
		#$purchase_but.text = "Owned"

func _on_exit_but_pressed():
	Global.music_menu = mumsic.get_playback_position()
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

func purchase(price):
	if Global.koin >= price:
		Global.koin -= price
		if egg == 1:
			egg1owned = true
		if egg == 2:
			egg2owned = true
		yes.play()
	else:
		no.play()

func _on_left_but_pressed():
	swap_item_back()
func _on_right_but_pressed():
	swap_item_forward()

func swap_item_back():
	if egg == 1:
		egg = 2
		theprice.text = str(egg2p)
	elif egg == 2:
		egg = 1
		theprice.text = str(egg1p)

func swap_item_forward():
	if egg == 1:
		egg = 2
		theprice.text = str(egg2p)
	elif egg == 2:
		egg = 1
		theprice.text = str(egg1p)
		


func _on_use_but_pressed():
	if use.text == "Used":
		no.play()
	elif use.text == "Use":
		if egg == 1:
			Global.skin = 0
		else:
			Global.skin = 1
		no_2.play()
	else:
		if egg == 1:
			purchase(0)
		else:
			purchase(10)

