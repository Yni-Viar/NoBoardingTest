extends TextureButton

func _on_pressed():
	Input.action_press("interact")


func _on_rclick_pressed():
	Input.action_press("interact_alt")
