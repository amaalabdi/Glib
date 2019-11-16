extends CollisionShape2D
func GoToPlayerAreaCollision():
		position.x = get_node("../../../Glib/GlibCollisionShape2D").get_global_position().x