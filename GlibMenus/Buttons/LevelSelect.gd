extends Button
#goes to option scene on button click
export(String) var scene_to_load
#--------------------add options menu scene script once complete ----------------------------

func _on_LevelSelectButton2_pressed():
		get_tree().change_scene('res://gameStart/LevelSelect.tscn');
