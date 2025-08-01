class_name enemy extends PathFollow3D

signal health_depleted

@export var damage = 0
@export var speed = 20
@export var health = 0
@export var damage_dampen = 1.0
@export var gold = 0
@export var score = 0

func take_damage(dmg: int):
	health -= dmg * damage_dampen
	if(health <= 0):
		health_depleted.emit(gold, score)

func _process(delta: float) -> void:
	progress += speed * delta
