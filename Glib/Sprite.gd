extends Sprite
var openmouth = preload("res://trap_enemy_1.png")
var closedmouth = preload("res://trap_enemy_0.png")
func _process(delta):
	if(get_node("..").is_on_floor() == false):
		set_texture(openmouth)
	if(get_node("..").is_on_floor()):
		set_texture(closedmouth)