extends Label
var count = 0
var seconds = 15
var minutes = 1
var stoptimer = 0
signal TimesUp
func updatetime():
	set_text("Time Remaining - " + str(minutes) + ":" + str(seconds)); 
	if(seconds == 10):
		set_text("Time Remaining - " + str(minutes) + ":10");
	if(seconds < 10):
		set_text("Time Remaining - " + str(minutes) + ":" + "0" + str(seconds));
	if(seconds == 0 && minutes == 0):
		emit_signal("TimesUp")
		return false 
	if (seconds == -1):
		minutes -= 1
		seconds = 59
	if (count % 60 == 0):
		seconds -= 1
func _process(delta): #Everything in this function calls at the rate of your fps. So 60fps = 60 times a second. 
	count += 1
	updatetime()