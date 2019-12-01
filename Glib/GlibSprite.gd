extends AnimatedSprite
var count = 0
var flashing = 0
func InvincibilityFlashing(body):
	if (body.get_name() == "Glib"):
		flashing = 1
func StopInvincibilityFlashing():
	flashing = 0 
	set_visible(true)
func _process(delta):
	count += 1
	if(flashing == 1 && get_node("..").walkrightcheck == 0  && get_node("..").walkleftcheck == 0):
		if(count % 5 == 0):
				hide() 
		if(count % 10 == 0):
			set_visible(true)