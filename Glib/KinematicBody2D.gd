 extends KinematicBody2D
var gravity = Vector2(0,1) # -x = left, +x = right, -y = up , +y = down. The arguments are Vector2(x,y).
var left = Vector2(-10,0)
var right = Vector2(10,0)
var up = Vector2(0,-16)
var floors = Vector2(0,-1) #Normal vector to describe what surfaces are considered floors. 
var jumpcheck = 0 #Checks to see if the player has pressed the jump button. 
func moveleft():
	if  Input.is_action_pressed("ui_left"):
		move_and_collide(left)
func moveright():
	if Input.is_action_pressed("ui_right"):
		move_and_collide(right)
func jump():
	if Input.is_action_just_pressed("ui_up"): #If the jump button is pressed and the player is standing on the ground, jumpcheck is set to 1, and the up vector is applied to the glib.
		if(is_on_floor()):
			jumpcheck = 1
			move_and_collide(up)
func bumped(body): #If glib hits another platform while jumping, it will stop the jump momentum.
	jumpcheck = 0
func _physics_process(delta):  
	move_and_slide(gravity,floors) #Argument 1 is to move the body a certain direction, Argument 2 is the floor vector. The gravity vector is applied to glib  
	moveright()
	moveleft()
	jump()
	if(!is_on_floor()): #If player is off the ground, then gravity increases while off the ground. 
		for x in range (0,10000):
			gravity.y += 0.004
	if(!is_on_floor() && jumpcheck == 1): #If the player if off the ground, and had pressed the jump button, the up vector is applied to glib, while also in the opposite direction of the gravity vector, which is increasing.
		move_and_collide(up)
	if(is_on_floor() && !Input.is_action_just_pressed("ui_up")): #When player lands, gravity and jumpcheck are both reset.
		jumpcheck = 0
		gravity.y = 1