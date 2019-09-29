 extends KinematicBody2D
var grav = Vector2(0,5)
var left = Vector2(-6,0)
var right = Vector2(6,0)
var jump = Vector2(0,-9)
var leftborder = 570.0
signal changecameraleft
signal changecameraright
signal changecameracenter
func moveleft():
	if  Input.is_action_pressed("ui_left"):
		move_and_collide(left)
func moveright():
	if Input.is_action_pressed("ui_right"):
		move_and_collide(right)
func jump():
	if Input.is_action_pressed("ui_up"):
		move_and_collide(jump)
func _physics_process(delta):
	if get_position().x >= (leftborder):
		emit_signal("changecameraleft")
		if get_position().x <= (leftborder):
			emit_signal("changecameracenter")
	if get_position().x <= (-540):
		emit_signal("changecameraright")
		if get_position().x >= (-540):
			emit_signal("changecameracenter")
	move_and_collide(grav)
	moveright()
	moveleft()
	jump()
	print(str(get_position()))