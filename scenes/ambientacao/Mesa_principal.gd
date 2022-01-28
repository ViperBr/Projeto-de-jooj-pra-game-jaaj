extends Area2D



func _on_Mesa_principal_area_entered(area):
	if area.is_in_group("weapon"):
		VariableSingleton.is_weapon_on_table = true



func _on_Mesa_principal_area_exited(area):
	if area.is_in_group("weapon"):
		VariableSingleton.is_weapon_on_table = false
