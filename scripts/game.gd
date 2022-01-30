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
	print_debug("instanciei uma sombra")
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
		$sombrapos/sombra1.can_i()
	if array[0] == "quem_e_peace":
		$sombrapos/sombra2.quem_e_peace()
	if array[0] == "sombra3_pode_morrer":
		$sombrapos/sombra3.sombra3_pode_morrer()
	if array[0] == "sombra4_pode_morrer":
		$sombrapos/sombra4.sombra4_pode_morrer()
	if array[0] == "sombra5_pode_morrer":
		$sombrapos/sombra5.sombra5_pode_morrer()
	if array[0] == "sombra6_se_mata":
		$sombrapos/sombra6.sombra6_se_mata()
	if array[0] == "sombra6_atira_espelho":
		$sombrapos/sombra6.sombra6_atira_espelho()
		
func dialog_events(array):
	if array[0] == "dialog_is_running":
		dialog_is_running()
	if array[0] == "dialog_not_running":
		dialog_not_running()
		
		
func dialog_is_running():
	VariableSingleton.is_there_dialog_running = true

func dialog_not_running():
	VariableSingleton.is_there_dialog_running = false
		
##For TESTING ONLY, REMOVE THIS AFTER THE GAME IS DONE
func skip_character():
	#if pressed K (which is the key for skipping)
	if Input.is_action_just_pressed("skip"):
		get_node("sombrapos/sombra%s" % data.character).set_animation_shooting_and_dead()
		data.dialog = 1
		#data.character += 1
		data.character = 6 ##substitui aqui pra qual numero do personagem quer ir direto
		
		save_state()
		print_debug("Character do data é : " + str(data.character))

##For TESTING ONLY, REMOVE THIS AFTER THE GAME IS DONE
func _process(delta):
	skip_character()
