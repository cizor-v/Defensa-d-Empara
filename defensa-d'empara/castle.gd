class_name castle extends Node3D

signal playerDeath

var health = 500;

func _on_area_3d_area_entered(area: Area3D) -> void:
	var potential_enemy = area.get_parent()
	if(potential_enemy is enemy):
		health -= potential_enemy.damage
		potential_enemy.get_parent().remove_child(potential_enemy)
		print("castle health: " + str(health))
		if (health <= 0):
			playerDeath.emit()
