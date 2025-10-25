extends Control

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainMenu.tscn")

func _on_unpause_button_pressed() -> void:
	get_tree().paused = false
	self.visible = false

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			if get_tree().paused == false:
				get_tree().paused = true
				self.visible = true
			else:
				get_tree().paused = false
				self.visible = false
