extends Area2D
@onready var egg = $"../egg"
@onready var hitbox = $hitbox
@onready var audio_stream_player = $AudioStreamPlayer

func _on_body_entered(body):
	if body.name == "egg":
		egg.int_scale = 13
		audio_stream_player.play()
		hitbox.position = Vector2.ZERO
		create_tween().tween_property(self, "modulate", Color(0,0,0,0), 0.3)
		await get_tree().create_timer(10).timeout
		egg.int_scale = 1
		queue_free()
		
func _process(_delta):
	if !Global.pause:
		position += Vector2.DOWN 
		rotation += 0.05
