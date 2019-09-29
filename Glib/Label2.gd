extends Label
var pos = get_position(KinematicBody2D)
func _process(delta):
	set_text(str(pos))
