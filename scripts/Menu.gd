extends Control

const SAVE_DIR = "user://saves/"

var save_path1 = SAVE_DIR + "save1.dat"
var save_path2 = SAVE_DIR + "save2.dat"
var save_path3 = SAVE_DIR + "save3.dat"

func _ready():
	for child in $".".get_children():
		child.visible = false
	$layerBase.visible = true;


func _on_slot1_button_up():
	var data = {
		"slot": 1,
		"saved_game": 1,
		"weapon_position": Vector2(62,278)
	}
	
	var dir = Directory.new()
	if not dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	var error = file.open(save_path1,File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
	
	SceneChanger.change_scene("res://scenes/zone test.tscn", "fade",data.weapon_position,save_path1)

func _on_slot2_button_up():
	var data = {
		"slot": 1,
		"saved_game": 1,
		"weapon_position": Vector2(62,278)
	}
	
	var dir = Directory.new()
	if not dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
		
	var file = File.new()
	var error = file.open(save_path2,File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
	SceneChanger.change_scene("res://scenes/zone test.tscn", "fade",data.weapon_position,save_path2)

func _on_slot3_button_up():
	var data = {
		"slot": 1,
		"saved_game": 1,
		"weapon_position": Vector2(62,278)
	}
	
	var dir = Directory.new()
	if not dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	var error = file.open(save_path3,File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
	SceneChanger.change_scene("res://scenes/zone test.tscn", "fade",data.weapon_position,save_path3)


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
	var file = File.new()
	if file.file_exists(save_path3):
		var error = file.open(save_path3,File.READ)
		if error == OK:
			var playerdata = file.get_var()
			file.close()
			SceneChanger.change_scene("res://scenes/zone test.tscn", "fade", playerdata, save_path3)
	else:
		$layerLoadGame/error.show()
	pass # Replace with function body.


func _on_save2_button_up():
	var file = File.new()
	if file.file_exists(save_path2):
		var error = file.open(save_path2,File.READ)
		if error == OK:
			var playerdata = file.get_var()
			file.close()
			SceneChanger.change_scene("res://scenes/zone test.tscn", "fade", playerdata,save_path2)
	else:
		$layerLoadGame/error.show()
	pass # Replace with function body.


func _on_save1_button_up():
	var file = File.new()
	if file.file_exists(save_path1):
		var error = file.open(save_path1,File.READ)
		if error == OK:
			var playerdata = file.get_var()
			file.close()
			SceneChanger.change_scene("res://scenes/zone test.tscn", "fade", playerdata,save_path1)
	else:
		$layerLoadGame/error.show()
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


func _on_ok_button_up():
	$layerLoadGame/error.hide()
	pass # Replace with function body.
