extends Control

var special_screen: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if special_screen:
		$Cursor.hide()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		$Cursor.show()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		input_values("exitgame")
	if Input.is_action_just_pressed("console"):
		input_values("console")
	if Input.is_action_just_pressed("human_inventory"):
		input_values("inventory")

func input_values(state: String):
	match state:
		"console":
			if !special_screen:
				get_tree().root.get_node("Game/InGameConsole").visible = true
				special_screen = true
			else:
				get_tree().root.get_node("Game/InGameConsole").visible = false
				special_screen = false
		"exitgame":
			if !special_screen:
				$PauseMenu.show()
				special_screen = true
			else:
				$PauseMenu.hide()
				special_screen = false
		"inventory":
			if !special_screen:
				get_tree().root.get_node("Game/Player/InventoryUI").show()
				special_screen = true
			else:
				get_tree().root.get_node("Game/Player/InventoryUI").hide()
				special_screen = false


func _on_exit_button_pressed():
	get_tree().root.get_node("Game").quit()
