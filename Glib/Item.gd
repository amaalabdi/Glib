extends Area2D
func disable(body):
	get_node("ItemCollisionShape2D").set_deferred("disabled",true)
func enable():
	get_node("ItemCollisionShape2D").set_deferred("disabled",false)