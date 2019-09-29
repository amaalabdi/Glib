extends Camera2D
var offset1 = Vector2(900,0)
var offset2 = Vector2(0,0)
var offset3 = Vector2(-900,0)
func _on_KinematicBody2D_changecameraleft():
	set_offset(offset1)
func _on_KinematicBody2D_changecameracenter():
	set_offset(offset2)
func _on_KinematicBody2D_changecameraright():
	set_offset(offset3)