extends Label
var count = 10000000
func _process(delta):
	count -= 1
	if count == 0:
		count += 1
	set_text(str(count))