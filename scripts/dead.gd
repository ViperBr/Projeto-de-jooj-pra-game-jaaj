extends Control


func _on_back_button_up():
	SceneChanger.change_scene("res://scenes/ambientacao/Menu.tscn")
	pass


func _on_restart_button_up():
	SceneChanger.change_scene("res://scenes/fases/prologue.tscn","fade",null,SceneChanger.path)
	pass 
