class_name enemy extends Node3D

@export var damage = 0
@export var speed = 1
@export var health = 0
@export var damage_dampen = 1
@export var gold = 0
@export var score = 0

func take_damage(dmg: int):
	health -= dmg * damage_dampen
	if(health <= 0):
		pass

# for movement, I have to figure out the path object (and script?) first :) 
