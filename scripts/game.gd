extends CanvasLayer

var file
var data
var new_dialog
func _ready():
	new_dialog= Dialogic.start("inicio_do_jogo1")
	file = File.new()
	file.open(SceneChanger.path,File.READ)
	data = file.get_var()
	if data.character == 1:
		new_dialog = Dialogic.start("inicio_do_jogo%s" % [data.dialog])
	else:
		new_dialog = Dialogic.start("game_chara%s_fala%s" % [data.character,data.dialog])
	file.close()
	add_child(new_dialog,true)
	pass 

func can_i():
	print_debug("chega aqui")
	$"Sombra1 (mulher)".can_i()

func save_state():
	if data.dialog < 3:
		data.dialog += 1
	else:
		data.dialog = 1
		data.character += 1
	data.date = "%s/%s/%s - %s:%s:%s" % [OS.get_datetime().day,OS.get_datetime().month,OS.get_datetime().year, OS.get_datetime().hour,OS.get_datetime().minute,OS.get_datetime().second] 
	file = File.new()
	file.open(SceneChanger.path,File.WRITE)
	file.store_var(data)
	file.close()
