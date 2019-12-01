extends KinematicBody2D
var gravity = Vector2(0,1) # -x = left, +x = right, -y = up , +y = down. The arguments are Vector2(x,y).
var left = Vector2(-10,0)
var right = Vector2(10,0)
var up = Vector2(0,-16)
var hit = Vector2(0,-gravity.y*10)
var floors = Vector2(0,-1) #Normal vector to describe what surfaces are considered floors. 
var jumpcheck = 0 #Checks to see if the player has pressed the jump button. 
var hitcheck = 0
var walkrightcheck = 0
var walkleftcheck = 0
signal walkright
signal stopright
signal walkrightflashing
signal stoprightflashing
signal walkleft
signal stopleft
signal walkleftflashing
signal stopleftflashing
func moveleft():
	if  Input.is_action_pressed("ui_left"):
		if(get_node("GlibSprite").flashing == 0):
			emit_signal("walkleft")
			walkleftcheck = 1
		if(get_node("GlibSprite").flashing == 1):
			emit_signal("walkleftflashing")
			walkleftcheck = 1
		hit.x = 6
		move_and_collide(left)
	if Input.is_action_just_released("ui_left"):
		emit_signal("stopleft")
		emit_signal("stopleftflashing")
		walkleftcheck = 0
func moveright():
	if Input.is_action_pressed("ui_right"):
		if(get_node("GlibSprite").flashing == 0):
			emit_signal("walkright")
			walkrightcheck = 1
		if(get_node("GlibSprite").flashing == 1):
			emit_signal("walkrightflashing")
			walkrightcheck = 1
		hit.x = -6
		move_and_collide(right)
	if Input.is_action_just_released("ui_right"):
		emit_signal("stopright")
		emit_signal("stoprightflashing")
		walkrightcheck = 0
func jump():
	if Input.is_action_just_pressed("ui_up"): #If the jump button is pressed and the player is standing on the ground, jumpcheck is set to 1, and the up vector is applied to the glib.
		if(is_on_floor()):
			jumpcheck = 1
			move_and_collide(up)
func bumped(body): #If glib hits another platform while jumping, it will stop the jump momentum.
	hitcheck = 0
	jumpcheck = 0
func knockback(body):
	if (body.get_name() == "Glib"):
		hitcheck = 1
		move_and_collide(hit)
func _ready():
	get_node("GlibWalkRight").hide()
	get_node("GlibWalkLeft").hide()
func _physics_process(delta):  
	if(is_on_floor()):
		hit.x = (get_node("/root/Node2D/Enemy1").enemy1move.x) * 2
		hit.y = -gravity.y*10
	move_and_slide(gravity,floors) #Argument 1 is to move the body a certain direction, Argument 2 is the floor vector. The gravity vector is applied to glib  
	moveright()
	moveleft()
	jump()
	if(!is_on_floor()): #If player is off the ground, then gravity increases while off the ground. 
		for x in range (0,10000):
			gravity.y += 0.004
	if(!is_on_floor() && jumpcheck == 1): #If the player if off the ground, and had pressed the jump button, the up vector is applied to glib, while also in the opposite direction of the gravity vector, which is increasing.
		move_and_collide(up)
	if(!is_on_floor() && hitcheck == 1):
		move_and_collide(hit)
		if(Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_Right")):
			hitcheck = 0
			gravity.y = 0
	if(is_on_floor() && !Input.is_action_just_pressed("ui_up")): #When player lands, gravity and jumpcheck are both reset.
		jumpcheck = 0
		hitcheck = 0
		gravity.y = 1