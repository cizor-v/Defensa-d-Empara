extends Control

@onready var scoreLabel : Label = $ColorRect/Panel/Panel/VBoxContainer/ScoreLabel

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainMenu.tscn")

func display_score() -> void:
	scoreLabel.text = "score: " + str(get_parent().score)
