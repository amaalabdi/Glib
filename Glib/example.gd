extends Node2D
func _process(delta):
	print(get_node("Glib").get_position())
	print(get_node("Enemy2").get_position())