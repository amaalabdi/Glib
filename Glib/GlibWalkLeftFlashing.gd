extends AnimatedSprite
func startwalkingleftflashing():
	set_visible(true)
	get_node("../GlibSprite").hide()
func stopwalkingleftflashing():
	hide()
	get_node("../GlibSprite").set_visible(true)
func _process(delta):
	if(get_node("../GlibSprite").flashing == 0):
		hide()