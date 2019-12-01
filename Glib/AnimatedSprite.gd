extends AnimatedSprite
func startwalkingright():
	set_visible(true)
	get_node("../GlibSprite").hide()
func stopwalkingright():
	hide()
	get_node("../GlibSprite").setvisible(true)
func _ready():
	hide()