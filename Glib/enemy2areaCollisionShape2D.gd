extends CollisionShape2D
func GoToPlayerAreaCollision():
	if(get_node("../../../Glib/GlibCollisionShape2D").get_global_position().y > position.y + 15):
		position.x = position.x
	if(get_node("../../../Glib/GlibCollisionShape2D").get_global_position().y <= position.y + 15 && get_node("../../../Glib").is_on_floor()):
		position.x = get_node("../../../Glib/GlibCollisionShape2D").get_global_position().x