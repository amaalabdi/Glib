extends AnimatedSprite
func startwalkingleft():
	set_visible(true)
	get_node("../GlibSprite").hide()
func stopwalkingleft():
	hide()
	get_node("../GlibSprite").set_visible(true)
func _process(delta):
	if(get_node("../GlibSprite").flashing == 1):
		hide()