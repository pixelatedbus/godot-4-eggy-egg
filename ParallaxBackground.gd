extends ParallaxBackground


func _process(delta):
	scroll_base_offset += Vector2(0,0.8)*delta
