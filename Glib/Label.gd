extends Label
var count = 0
var seconds = 0
var minutes = 1
var stoptimer = 0
var timesubtracted = 15
signal TimesUp
func updatetime():
	set_text("Time Remaining - " + str(minutes) + ":" + str(seconds)); 
	if(seconds == 10):
		set_text("Time Remaining - " + str(minutes) + ":10");
	if(seconds < 10):
		set_text("Time Remaining - " + str(minutes) + ":" + "0" + str(seconds));
	if(seconds <= 0 && minutes <= 0):
		seconds = 0
		emit_signal("TimesUp")
		return false 
	if (seconds < 0):
		minutes -= 1
		seconds += 59
	if (seconds > 59):
		minutes += 1
		seconds -= 60
	if (count % 60 == 0):
		seconds -= 1
func addtime(body):
	if(body.get_name() == "Glib"):
		seconds += 30
func taketime(body):
	if (body.get_name() == "Glib"):
		seconds -= timesubtracted
		timesubtracted = 0
func resettimesubtracted():
	timesubtracted = 15
func _process(delta): #Everything in this function calls at the rate of your fps. So 60fps = 60 times a second. 
	count += 1
	updatetime()