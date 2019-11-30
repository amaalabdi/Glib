extends KinematicBody2D
var gravity = Vector2(0,1)
var floors = Vector2(0,-1)
var jump = Vector2(7,-7) 
var jumpcheck = 0
signal jumpdelay
func enemyjump(body):
	if(body.get_name() == "Glib"):
		if(is_on_floor()):
			if(get_node("../Glib/GlibCollisionShape2D").get_global_position().x > position.x):
				jump.x = 7
				move_and_collide(jump)
				jumpcheck = 1
				emit_signal("jumpdelay")
			if(get_node("../Glib/GlibCollisionShape2D").get_global_position().x < position.x):
				jump.x = -7
				move_and_collide(jump)
				jumpcheck = 1
				emit_signal("jumpdelay")
func JumpAgain():
	if(is_on_floor()):
			if(get_node("../Glib/GlibCollisionShape2D").get_global_position().x > position.x):
				jump.x = 7
				move_and_collide(jump)
				jumpcheck = 1
				emit_signal("jumpdelay")
			if(get_node("../Glib/GlibCollisionShape2D").get_global_position().x < position.x):
				jump.x = -7
				move_and_collide(jump)
				jumpcheck = 1
				emit_signal("jumpdelay")
func _physics_process(delta):
	move_and_slide(gravity,floors)
	if(!is_on_floor()): 
		for x in range (0,10000):
			gravity.y += 0.002
	if(is_on_floor()):
		gravity.y = 1
		jumpcheck = 0
	if(!is_on_floor() && jumpcheck == 1):
		move_and_collide(jump)


