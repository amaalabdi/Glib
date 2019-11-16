extends CollisionShape2D
func GoToPlayerHitArea():
	position.x = get_node("../../../Glib/GlibCollisionShape2D").get_global_position().x