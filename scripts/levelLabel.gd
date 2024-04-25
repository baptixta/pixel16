extends Label

var xp = 0
var level = 1

func _on_mob_squashed():
	xp += 1
	$HSlider.value = xp
	
	if $HSlider.value == $HSlider.max_value:
		level_up()
		improve_character()

func level_up():
	$HSlider.value = 0
	$HSlider.max_value += 10
	level += 1
	text = "Nível: " + str(level)

func improve_character():
	
	print("melhoria pra escolher")
