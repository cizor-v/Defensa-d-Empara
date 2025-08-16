extends Control

func _on_level1Button_pressed() -> void:
	get_tree().change_scene_to_file("res://level1.tscn")

func _on_level2Button_pressed() -> void:
	get_tree().change_scene_to_file("res://level2.tscn")

func _on_level3Button_pressed() -> void:
	get_tree().change_scene_to_file("res://level3.tscn")

func _on_quitGameButton_pressed() -> void:
	get_tree().quit()
