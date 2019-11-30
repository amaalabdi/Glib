extends CollisionShape2D
signal startdigging
signal digging
func entered(body):
	if(body.get_name() == "Glib"):
		emit_signal("startdigging")
func dig():
		position = Vector2(get_position().x,get_position().y - 65)
		get_node("../enemy2HitArea/HitAreaShape2D").set_deferred("disabled", true)
		emit_signal("digging")
func GoToPlayerCollision():
	if(get_node("../../Glib/GlibCollisionShape2D").get_global_position().y > position.y + 15):
		position.x = position.x
	if(get_node("../../Glib/GlibCollisionShape2D").get_global_position().y <= position.y + 15 && get_node("../../Glib").is_on_floor()):
		position.x = get_node("../../Glib/GlibCollisionShape2D").get_global_position().x