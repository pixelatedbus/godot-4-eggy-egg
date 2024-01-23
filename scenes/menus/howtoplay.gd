extends Control

@onready var htptexts = $htptext
@onready var icon = $Panel2/htplay
var scene = 1
@onready var mumsic = $mumsic

var htp_text = {
	"scene1": "Selamat Datang di Eggy Egg!", 
	"scene2": "Tarik dan tahan telur ke belakang untuk bersiap-siap, Kamu bisa mengatur arah lintasan telur dengan swipe ke kiri, kanan, atas, dan bawah.",
	"scene3": "Arahkan ke ketapel selanjutnya yang ada di atas.",
	"scene4": "Lepaskan untuk memulai penerbangan, lakukan terus dan dapatkan skor setinggi mungkin!",
	"scene5": "Ini adalah sebuah power up. Bila kamu bisa mendapatkannya, kamu akan dapat kemampuan tambahan. Terdapat berbagai kemampuan unik yang dapat kamu peroleh. Coba temukan semuanya!!!",
	"scene6": "Koleksi koin sebanyak-banyaknya untuk membuka skin baru untuk telur kamu",
	"scene7": "Selama penerbangan terdapat berbagai rintangan yang dapat mengganggu penerbangan, Hindari rintangan-rintangan ini agar telur bisa terbang secara sempurna.",
	"scene8": "Pro tip: Jika kamu mengarahkan telur keluar layar pada sebelah kiri/kanan, telur dapat berpindah ke sisi seberangnya! Gunakan trik ini untuk mencapai ketapel yang sulit dijangkau!"
	}
# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel2/htplay.play("scene1")
	scene = 1
	htptexts.text = htp_text["scene1"]
# Called every frame. 'delta' is the elapsed time since the previous frame.
	
func _physics_process(_delta):
	#if self.visible == true:
		#for i in range(7):
			#if scene == i+1:
				#$Panel2/htplay.play(htp_text["scene" + str(i+1)])
				#icon.play("scene" + str(i+1))
	pass

func _on_left_but_pressed():
	swap_item_back()


func _on_right_but_pressed():
	swap_item_forward()


func swap_item_forward():
	if scene == 7:
		scene = 1
		htptexts.text = htp_text["scene1"]
	else:
		scene += 1
		htptexts.text = htp_text["scene" + str(scene)]

func swap_item_back():
	if scene == 1:
		scene = 8
		htptexts.text = htp_text["scene7"]
	else:
		scene -= 1
		htptexts.text = htp_text["scene" + str(scene)]

func _on_exit_but_pressed():
	Global.music_menu = mumsic.get_playback_position()
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
