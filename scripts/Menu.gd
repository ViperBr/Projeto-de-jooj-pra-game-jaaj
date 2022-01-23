extends Control

func _ready():
	for child in $".".get_children():
		child.visible = false
	$layerBase.visible = true;



func _on_slot1_button_up():
	SceneChanger.change_scene("res://scenes/zone test.tscn", "fade")

func _on_slot2_button_up():
	SceneChanger.change_scene("res://scenes/zone test.tscn", "fade")

func _on_slot3_button_up():
	SceneChanger.change_scene("res://scenes/zone test.tscn", "fade")


func _on_newGame_button_up():
	for child in $".".get_children():
		child.visible = false
	$layerNewGame.visible = true
	pass # Replace with function body.


func _on_back_button_up():
	for child in $".".get_children():
		child.visible = false
	$layerBase.visible = true;
	pass # Replace with function body.


func _on_loadGame_button_up():
	for child in $".".get_children():
		child.visible = false
	$layerLoadGame.visible = true;
	pass # Replace with function body.


func _on_save3_button_up():
	pass # Replace with function body.


func _on_save2_button_up():
	pass # Replace with function body.


func _on_save1_button_up():
	pass # Replace with function body.


func _on_settings_button_up():
	for child in $".".get_children():
		child.visible = false
	$layerConfigs.visible = true;
	pass # Replace with function body.


func _on_exit_button_up():
	$layerBase/confirm.show()
	$layerBase/confirm/WindowDialog.show()
	pass # Replace with function body.

func _on_dont_button_up():
	$layerBase/confirm.hide()
	$layerBase/confirm/WindowDialog.hide()
	pass # Replace with function body.


func _on_confirmexit_button_up():
	get_tree().quit()
	pass # Replace with function body.
