class_name castle extends Node3D

signal playerDeath
signal playerHurt

var max_health = 500
var health = max_health;

func _on_area_3d_area_entered(area: Area3D) -> void:
	var potential_enemy = area.get_parent()
	if(potential_enemy is enemy):
		#potential_enemy.take_damage(1000) # for testing victory
		health -= potential_enemy.damage
		potential_enemy.get_parent().remove_child(potential_enemy)
		print("castle health: " + str(health))
		playerHurt.emit(health, max_health)
		if (health <= 0):
			playerDeath.emit()
