extends Timer
func startdigging():
	wait_time = randf()
	if(wait_time >= 0.5):
		start()
	else:
		startdigging()