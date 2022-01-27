extends CanvasLayer


func _ready():
	var new_dialog = Dialogic.start("prologue")
	
	var file = File.new()
	if file.file_exists(SceneChanger.path):
		file.open(SceneChanger.path,File.READ)
		var lite = file.get_var()
		if lite.dialog != 1 and lite.character != 1:
			new_dialog = Dialogic.start("prologue")
	$Control.add_child(new_dialog)
	pass 

func change_scene():
	SceneChanger.change_scene("res://scenes/fases/inicio_do_jogo.tscn")
