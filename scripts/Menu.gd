extends Control

const SAVE_DIR = "user://saves/"

var save_path1 = SAVE_DIR + "save1.dat"
var save_path2 = SAVE_DIR + "save2.dat"
var save_path3 = SAVE_DIR + "save3.dat"

func _ready():
	for child in $".".get_children():
		child.visible = false
	$layerBase.visible = true;
	print_debug("%s/%s/%s - %s:%s:%s" % [OS.get_datetime().day,OS.get_datetime().month,OS.get_datetime().year, OS.get_datetime().hour,OS.get_datetime().minute,OS.get_datetime().second] )
onready var data = {
		"slot": 1,
		"saved_game": 1,
		"weapon_position": Vector2(850,278),
		"dialog": 1,
		"character":1,
		"date": "%s/%s/%s - %s:%s:%s" % [OS.get_datetime().day,OS.get_datetime().month,OS.get_datetime().year, OS.get_datetime().hour,OS.get_datetime().minute,OS.get_datetime().second] 
	}

func _on_slot1_button_up():
	
	
	var dir = Directory.new()
	if not dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	var error = file.open(save_path1,File.WRITE)
	if error == OK:
		data.date = "%s/%s/%s - %s:%s:%s" % [OS.get_datetime().day,OS.get_datetime().month,OS.get_datetime().year, OS.get_datetime().hour,OS.get_datetime().minute,OS.get_datetime().second]
		file.store_var(data)
		file.close()
	
	SceneChanger.change_scene("res://scenes/fases/prologue.tscn", "fade",data.weapon_position,save_path1)

func _on_slot2_button_up():
	
	
	var dir = Directory.new()
	if not dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
		
	var file = File.new()
	var error = file.open(save_path2,File.WRITE)
	if error == OK:
		data.date = "%s/%s/%s - %s:%s:%s" % [OS.get_datetime().day,OS.get_datetime().month,OS.get_datetime().year, OS.get_datetime().hour,OS.get_datetime().minute,OS.get_datetime().second]
		file.store_var(data)
		file.close()
	SceneChanger.change_scene("res://scenes/fases/prologue.tscn", "fade",data.weapon_position,save_path2)

func _on_slot3_button_up():
	
	
	var dir = Directory.new()
	if not dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	var error = file.open(save_path3,File.WRITE)
	if error == OK:
		data.date = "%s/%s/%s - %s:%s:%s" % [OS.get_datetime().day,OS.get_datetime().month,OS.get_datetime().year, OS.get_datetime().hour,OS.get_datetime().minute,OS.get_datetime().second]
		file.store_var(data)
		file.close()
	SceneChanger.change_scene("res://scenes/fases/prologue.tscn", "fade",data.weapon_position,save_path3)


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
	var file = File.new()
	if file.file_exists(save_path1):
		file.open(save_path1,File.READ)
		var player_data = file.get_var()
		if player_data.date:
			$layerLoadGame/save1.set_text(player_data.date)
		file.close()
	if file.file_exists(save_path2) and file.get_var().date:
		file.open(save_path2,File.READ)
		var player_data = file.get_var()
		if player_data.date:
			$layerLoadGame/save2.text = player_data.date
		file.close()
	if file.file_exists(save_path3) :
		file.open(save_path3,File.READ)
		var player_data = file.get_var()
		if player_data.date:
			$layerLoadGame/save3.text = player_data.date
		file.close()
	pass # Replace with function body.


func _on_save3_button_up():
	var file = File.new()
	if file.file_exists(save_path3):
		var error = file.open(save_path3,File.READ)
		if error == OK:
			var playerdata = file.get_var()
			file.close()
			SceneChanger.change_scene("res://scenes/fases/prologue.tscn", "fade", playerdata, save_path3)
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
			SceneChanger.change_scene("res://scenes/fases/prologue.tscn", "fade", playerdata,save_path2)
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
			SceneChanger.change_scene("res://scenes/fases/prologue.tscn", "fade", playerdata,save_path1)
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
