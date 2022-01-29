extends Node

var file
var data
var new_dialog
func _ready():
	file = File.new()
	file.open(SceneChanger.path,File.READ)
	data = file.get_var()
	file.close()
	removing()
	pass 

func removing():
	if get_node("sombra%s" % str(int(data.character)-1)):
		get_node("sombra%s" % str(int(data.character)-1)).queue_free()
	VariableSingleton.character = int(data.character)
	$sombrapos.add_child(load("res://scenes/atores/sombra%s/sombra%s.tscn" % [data.character,data.character]).instance())
	var sombra = get_node("sombrapos/sombra%s" % data.character)
	sombra.position = Vector2(359,515)
	new_dialog = Dialogic.start("game_chara_%s_fala_%s" % [data.character,data.dialog])
	add_child(new_dialog,true)

func save_state():
	
	data.date = "%s/%s/%s - %s:%s:%s" % [OS.get_datetime().day,OS.get_datetime().month,OS.get_datetime().year, OS.get_datetime().hour,OS.get_datetime().minute,OS.get_datetime().second] 
	file = File.new()
	file.open(SceneChanger.path,File.WRITE)
	file.store_var(data)
	file.close()

func sombra_is_shooting():
	if data.dialog < 5:
		data.dialog += 1
		
		new_dialog= Dialogic.start("game_chara_%s_fala_%s" % [data.character,data.dialog])
		add_child(new_dialog,true)
		get_node("sombrapos/sombra%s" % data.character).set_animation_shooting()
		save_state()
	else:
		get_node("sombrapos/sombra%s" % data.character).set_animation_shooting_and_dead()
		data.dialog = 1
		data.character += 1
		save_state()

func events(array):
	if array[0] == "can_i":
		print_debug("chega")
		$sombrapos/sombra1.can_i()
