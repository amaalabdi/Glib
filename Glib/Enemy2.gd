extends KinematicBody2D
var gravity = Vector2(0,1)
var floors = Vector2(0,-1)
signal delay
func _physics_process(delta):
	move_and_slide(gravity,floors)
	if(!is_on_floor()): 
		for x in range (0,10000):
			gravity.y += 0.0009
	if(is_on_floor()):
		gravity.y = 1
func diggingup():
	get_node("enemy2CollisionShape2D").position.y += 65
	position.y -= 65
	get_node("enemy2HitArea/HitAreaShape2D").set_deferred("disabled", false)
	emit_signal("delay")