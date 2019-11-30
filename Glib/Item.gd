extends Area2D
func disable(body):
	if(body.get_name() == "Glib"):
		get_node("ItemCollisionShape2D").set_deferred("disabled",true)
func enable():
	get_node("ItemCollisionShape2D").set_deferred("disabled",false)