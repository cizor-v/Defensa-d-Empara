class_name castle extends Node3D

signal health_depleted

var health = 500;

func _on_area_3d_area_entered(area: Area3D) -> void:
	if(area.get_parent().name == "enemy"):
		health -= area.get_parent().damage
		if (health <= 0):
			health_depleted.emit()
