extends KinematicBody2D
var glide = Vector2(0,0)
var gravity = Vector2(0,0)
var floors = Vector2(0,-1)
var stopcheck = 0
func BounceSides(body):
	glide.x = -glide.x 
func BounceGround(body):
	glide.y = -glide.y * 0.8
func stop(body):
	pass
func _physics_process(delta):
	if(get_node("../Glib/GlibCollisionShape2D").get_global_position().x > position.x):
		glide.x = glide.x + 0.2
	if(get_node("../Glib/GlibCollisionShape2D").get_global_position().x < position.x):
		glide.x = glide.x - 0.2
	if(get_node("../Glib/GlibCollisionShape2D").get_global_position().y > position.y):
		glide.y = glide.y + 0.2
	if(get_node("../Glib/GlibCollisionShape2D").get_global_position().y < position.y):
		glide.y = glide.y - 0.2
	move_and_slide(gravity,floors)
	move_and_collide(glide)