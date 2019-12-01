extends AnimatedSprite
func startwalkingright():
	set_visible(true)
	get_node("../GlibSprite").hide()
func stopwalkingright():
	hide()
	get_node("../GlibSprite").set_visible(true)
func _process(delta):
	if(get_node("../GlibSprite").flashing == 1):
		hide()