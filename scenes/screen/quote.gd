extends Label

var quote: Array = ["What an egg-cellent try!", "That was egg-stremely fun!", "Mission failed, we’ll hatch ‘em next time!", "The Egg experienced kinetic energy.","What is done is done, and the cracked egg cannot be cured.","What is done is done, and the cracked egg cannot be cured.","'A true friend is someone who thinks that you are a good egg even though he knows that you are slightly cracked.' ~ Bernard Meltzer","'The egg can be your best friend if you just give it the right break' ~ Julia Child","'Probably one of the most private things in the world is an egg until it is broken.' ~ M. F. K. Fisher","The Egg hit the ground too hard.", "Nah, I’d win.", "Ah crack, here we go again.."]

func _on_visibility_changed():
	text = quote[randi_range(0,11)]
