extends Sprite
func hideitem(body):
	if(body.get_name() == "Glib"):
		hide()
func unhideitem():
	set_visible(true)