extends Node3D

@onready var timer1sec : Timer = $Timer
@onready var waveTimer : Timer = $WaveTimer
@onready var spawnTimer : Timer = $SpawnTimer

@onready var enemyPath : Path3D = $Path3D

@onready var victoryScreen : Control = $VictoryScreen
@onready var defeatScreen : Control = $DefeatScreen

# HUD to update
@onready var hud : Control = $HUD

# gold and score are not instance editable
var gold : int = 0
var score : int = 0
@export var goldPerSec : int = 1

# ennemy waves are instance editable, as we want each level to have different difficulties
@export var maxNbWaves : int = 5
@export var hardWaveFreq : int = 3 # there will be a "hard" wave every hardWaveFreq waves, last wave is always "hard"
var isHardWave : bool = false
var currentWave : int = 0
var nbEnemySpawned : int = 0

func _ready() -> void:
	timer1sec.timeout.connect(_on_1secTimeout)
	timer1sec.start()
	waveTimer.timeout.connect(_on_waveTimeout)
	waveTimer.start()
	spawnTimer.timeout.connect(_on_spawnTimeout)

func _process(_delta: float) -> void:
	hud.update_values(gold, score, currentWave, maxNbWaves)

func _on_1secTimeout() -> void:
	gold += goldPerSec
	print("gold: " + str(gold))

func _on_waveTimeout() -> void:
	currentWave += 1
	nbEnemySpawned = 0
	spawnTimer.start()
	if (currentWave >= maxNbWaves):
		waveTimer.stop()
		print("victory")
		get_tree().paused = true
		victoryScreen.display_score()
		victoryScreen.visible = true

func _on_spawnTimeout() -> void:
	if (currentWave % hardWaveFreq == 0 || currentWave == maxNbWaves):
		spawnHardWave()
	else:
		spawnNormalWave()
	
	nbEnemySpawned += 1
	
	if (nbEnemySpawned >= 10):
		spawnTimer.stop()

# will spawn an enemy with "hard wave" probabilities
func spawnHardWave() -> void:
	var rand = randi() % 10
	var enemyToSpawn
	if (rand <= 2):
		enemyToSpawn = preload("res://soldier.tscn")
	elif (rand <= 6):
		enemyToSpawn = preload("res://knight.tscn")
	elif (rand <= 9):
		enemyToSpawn = preload("res://ram.tscn")
	
	enemyPath.add_child(enemyToSpawn.instantiate())

# will spawn an enemy with "normal wave" probabilites
func spawnNormalWave() -> void:
	var rand = randi() % 10
	var enemyToSpawn
	if (rand <= 4):
		enemyToSpawn = preload("res://soldier.tscn")
	elif (rand <= 8):
		enemyToSpawn = preload("res://knight.tscn")
	elif (rand == 9):
		enemyToSpawn = preload("res://ram.tscn")
	
	enemyPath.add_child(enemyToSpawn.instantiate())

func _on_playerHurt(health, max_health) -> void:
	hud.update_HP(health, max_health)

func _on_enemyDeath(enemyGold, enemyScore) -> void:
	gold += enemyGold
	score += enemyScore

func _on_playerDeath() -> void:
	print("player death")
	get_tree().paused = true
	defeatScreen.display_score()
	defeatScreen.visible = true
