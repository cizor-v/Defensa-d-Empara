class_name enemy extends PathFollow3D

signal enemyDeath

@export var damage = 0
@export var speed = 20
@export var health = 0
@export var damage_dampen = 1.0
@export var gold = 0
@export var score = 0

func _ready() -> void:
	enemyDeath.connect(get_parent().get_parent()._on_enemyDeath.bind(gold, score))
	

func take_damage(dmg: int):
	health -= dmg * damage_dampen
	if(health <= 0):
		enemyDeath.emit()
		get_parent().remove_child(self)

func _process(delta: float) -> void:
	progress += speed * delta
