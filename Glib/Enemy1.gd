extends KinematicBody2D
var gravity = Vector2(0,1)
var floors = Vector2(0,-1)
var enemy1move = Vector2(-4,0)
var left = 1
func turn():
	enemy1move.x = -enemy1move.x
	left = -left 
func enemy1mover():
	move_and_collide(enemy1move)
func _ready():
	get_node("EnemyWalkRight").hide()
func _process(delta):
	if(left == 1):
		get_node("EnemyWalkRight").hide()
		get_node("EnemyWalkLeft").set_visible(true)
	if(left == -1):
		get_node("EnemyWalkRight").set_visible(true)
		get_node("EnemyWalkLeft").hide()
func _physics_process(delta):
	move_and_slide(gravity,floors)
	if(!is_on_floor()): 
		for x in range (0,10000):
			gravity.y += 0.002
	if(is_on_floor()):
		gravity.y = 1
	enemy1mover()