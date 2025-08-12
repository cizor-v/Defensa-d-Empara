extends Node3D

@onready var timer1sec : Timer = $Timer

# gold and score are not instance editable
var gold : int = 0
var score : int = 0
@export var goldPerSec : int = 1

# ennemy waves are instance editable, as we want each level to have different difficulties
@export var maxNbWaves : int = 5
@export var hardWaveFreq : int = 3 # there will be a "hard" wave every hardWaveFreq waves, last wave is always "hard"
var currentWave : int = 0

func _ready() -> void:
	timer1sec.timeout.connect(_on_1secTimeout)
	timer1sec.start()

func _on_1secTimeout() -> void:
	gold += goldPerSec
	#print("gold: " + str(gold))

func _on_enemyDeath(enemyGold, enemyScore) -> void:
	gold += enemyGold
	score += enemyScore

func _on_playerDeath() -> void:
	pass
