extends CheckButton

func _ready():
	var player = get_node("root/AudioStreamPlayer");

#Turns music off when toggled
func _on_MusicToggle_toggled(button_pressed, player):
	player.stop()
