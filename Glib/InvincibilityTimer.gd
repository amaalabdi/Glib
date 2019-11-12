extends Timer
var alreadyhit = 0
func starttimer(body):
	if (body.get_name() == "Glib"):
		start()