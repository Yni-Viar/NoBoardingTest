extends DoorBase


#func door_controller(keycard: int):
	#super.door_controller(keycard)
	#if is_opened && !get_node("AnimationPlayer").is_playing():
		#door_close()
	#elif !get_node("AnimationPlayer").is_playing():
		#door_open()


func _on_area_3d_body_entered(body):
	door_open()


func _on_area_3d_body_exited(body):
	door_close()
