extends KinematicBody2D
var gravity = Vector2(0,1)
var floors = Vector2(0,-1)
var enemy1move = Vector2(4,0)
func turn():
	enemy1move.x = -enemy1move.x
func enemy1mover():
	move_and_collide(enemy1move)
func _physics_process(delta):
	move_and_slide(gravity,floors)
	if(!is_on_floor()): 
		for x in range (0,10000):
			gravity.y += 0.002
	enemy1mover()