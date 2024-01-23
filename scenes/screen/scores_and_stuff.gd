extends Control

@onready var main = $".."
@onready var points = $menu/points
@onready var menu = $menu
@onready var coin = $menu/coin

func _process(_delta):
	points.text = str(main.points)
	coin.text = str(main.coins)
	



