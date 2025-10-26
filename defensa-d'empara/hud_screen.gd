extends Control

@onready var scoreLabel : Label = $MarginContainer/VBoxContainer/HBoxContainer/Score
@onready var goldLabel : Label = $MarginContainer/VBoxContainer/HBoxContainer2/Or
@onready var HPbar : ProgressBar = $MarginContainer2/VBoxContainer/HP
@onready var waveLabel : Label = $MarginContainer2/VBoxContainer/HBoxContainer/Wave

func update_values(gold , score, currentWave, maxWaves) -> void:
	scoreLabel.text = str(score)
	goldLabel.text = str(gold)
	waveLabel.text = str(currentWave) + " / " + str(maxWaves)

func update_HP(hp , max_hp) -> void:
	var percentage = (float(hp) / float(max_hp)) * 100.
	HPbar.set_value(percentage)
