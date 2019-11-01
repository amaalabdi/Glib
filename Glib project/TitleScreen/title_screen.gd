extends Control
var scene_path_to_load

#function for buttons to gameplay/options menu
func _ready():
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "on_Button_Pressed", [button.scene_to_load])
		
		
		#fades to black when button is pressed
func on_Button_Pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fadeIn()

#loads next scene after fade animation is completed
func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
