extends Label
var count = 0
var seconds = 0
var minutes = 0
var stoptimer = 0
func TimerUp():
	set_text("You surivived for " + str(minutes) + " minute(s) and " + str(seconds) + " second(s) !")
	stoptimer = 1
func updatetime():
	if(stoptimer == 1):
		return false
	if (seconds == 60):
		minutes += 1
		seconds = 0
	if (count % 60 == 0):
		seconds += 1
func _process(delta): #Everything in this function calls at the rate of your fps. So 60 fps = 60 times a second. 
	count += 1
	updatetime()