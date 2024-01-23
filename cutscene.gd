extends Control
@onready var texture_rect = $Panel/ParallaxBackground/ParallaxLayer/TextureRect

@onready var con_button = $Panel/bg_text/con_button
@onready var narration = $Panel/bg_text/narration
@onready var effect = $Panel/bg_text/narration/effect
@onready var button = $Panel/bg_text/con_button
var scene : int = 1
var total_narr = 15
var narr = {
	"n1" : "Pada suatu hari yang terlihat damai, terdapat tiga buah telur yang sedang beristirahat yang induknya entah kemana.",
	"n2" : "Lalu mereka melihat ada sebuah elang yang terbang tinggi di langit.",
	"n3" : "Mereka sangat takjub dan ingin terbang setinggi langit juga.",
	"n4" : "Salah satu dari telur itu memiliki ide yang cemerlang",
	"n5" : "yaitu membuat sayap buatan yang menyerupai elang yang mereka lihat.",
	"n6" : "Telur itu terbang dengan sayap buatannya.",
	"n7" : "Namun, nahasnya sayap yang dibuat tidak kuat untuk menebarkan telur",
	"n8" : "Telur itu terjatuh dan pecah",
	"n9" : "menyisakan dua telur lainnya.",
	"n10" : "Telur yang kedua memiliki ide yang menarik",
	"n11" : "yaitu membuat jet yang bisa menerbangkan telur.",
	"n12" : "Namun, jet itu juga tidak bisa menerbangkan telur dalam waktu yang lama",
	"n13" : "Pada akhirnya, jet itu tetap jatuh dari langit karena kehabisan bahan bakar",
	"n14" : "Telur kedua pun pecah, meninggalkan satu telur sendirian",
	"n15" : "Telur tersebut sedih karena dua saudaranya telah meninggal.",
	"n16" : "Tak lama kemudian, telur itu melihat sesuatu di langit.",
	"n17" : "Mereka adalah  arwah dari kedua telur yang telah pecah",
	"n18" : "Kedua arwah tersebut menyarankan untuk membuat sebuah perangkat untuk melemparkan telur (Ketapel) yang diberi nama “Best and Ultimately Safe Egg Thrower” (B.U.S.E.T)",
	"n19" : "Lalu telur itu merakit sebuah ketapel sendirian. Setelah beberapa kali mengalami kegagalan akhirnya telur bisa terbang ke langit."
}
# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/bg_scenes/storyscenes.play("story1")
	scene = 1
	narration.text = narr["n1"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Panel/bg_scenes/storyscenes.play("story"+str(scene))

func _on_animation_finished():
	pass

func _on_con_button_pressed():
	if scene >= len(narr):
		con_button.queue_free()
		create_tween().tween_property(self, "modulate", Color(0, 0, 0, 1), 1)
		create_tween().tween_property(texture_rect, "modulate", Color(0, 0, 0, 1), 1)
		await get_tree().create_timer(1.01).timeout
		get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
	else:
		scene += 1
		narration.text = narr["n" + str(scene)]
		

