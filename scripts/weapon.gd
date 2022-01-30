extends Node2D

var path
var selected = false;
var taked_weapon = false;
var rest_point
var rest_nodes = []
var data

onready var rotation_degree_speed = 6

onready var my_turn:bool
onready var initial_position
const SPEED = 25

var shortest_dist = 200

onready var timer_give_weapon

func _ready():
	my_turn = true
	initial_position = position
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[0].global_position
	set_weapon_bullets()
	$roleta.hide()
	$seta.hide()
	
	timer_give_weapon = Timer.new()
	timer_give_weapon.set_one_shot(true)
	timer_give_weapon.set_wait_time(2)
	add_child(timer_give_weapon)
	timer_give_weapon.connect("timeout",self,"_enable_weapon_visibility")
	
	

func set_weapon_bullets():
	if VariableSingleton.character == 2:
		$roleta.play("2bullets")
	elif VariableSingleton.character == 3:
		$roleta.play("3bullets")
	elif VariableSingleton.character == 4:
		$roleta.play("4bullets")
	elif VariableSingleton.character == 5:
		$roleta.play("5bullets")
		rotation_degree_speed = 5
	elif VariableSingleton.character == 6:
		$roleta.play("6bullets")
		my_turn = false
		$AnimatedSprite.visible = false
	elif VariableSingleton.character == 1:
		$roleta.play("1bullet")
	else:
		$roleta.play("0bullets")

func set_sombra_shot():
	if not my_turn:
		get_node("/root/inicio_do_jogo").sombra_is_shooting()
		set_weapon_bullets()
		my_turn = true
		$AnimatedSprite.visible = false
		timer_give_weapon.start()
		global_position = lerp(global_position, initial_position, SPEED * get_physics_process_delta_time())

func _enable_weapon_visibility():
	$AnimatedSprite.visible = true
	print_debug("ativo a visibilidade da arma")

func _on_Weapon_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click") and not taked_weapon:
		selected = true;
	else:
		selected = false
	
	if Input.is_action_just_pressed("click") and taked_weapon:
		get_shot()

func _process(delta):
	
	if my_turn:
		$AnimatedSprite.play("up")
	else:
		$AnimatedSprite.play("down")
	
	if selected: #and VariableSingleton.is_weapon_on_table:
		global_position = lerp(global_position, get_global_mouse_position(), SPEED * delta);
	
	if selected and not VariableSingleton.is_weapon_on_table:
		return
	
	if not selected and not VariableSingleton.is_weapon_on_table:
		global_position = lerp(global_position,initial_position, 5 * delta)
		
		
	if taked_weapon:
		set_weapon_bullets()
		$AnimatedSprite.hide()
		$roleta.show()
		$seta.show()
		if $roleta.rotation_degrees < 360:
			$roleta.rotation_degrees += rotation_degree_speed
		else:
			$roleta.rotation_degrees = 0

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:

			selected = false
			
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)

				if distance <= shortest_dist and child.name == "get_weapon" and my_turn:
					taked_weapon = true;
					initial_position = child.global_position
					return
				elif distance <= shortest_dist and child.name == "send_weapon":
					rest_point = child.global_position
					set_sombra_shot()
					return

func set_dead():
	SceneChanger.change_scene("res://scenes/fases/dead.tscn", "fade", null, SceneChanger.path)

func get_shot():
	taked_weapon = false
	my_turn = false
	for bullet in $seta/arrow.get_overlapping_areas():
		if bullet.name == "bullet1":
			set_dead();
		elif bullet.name == "bullet2" and get_node("/root/inicio_do_jogo").data.character >= 2:
			set_dead();
	$AnimatedSprite.show()
	$roleta.hide()
	$seta.hide()
	global_position = Vector2(1413,777)
	
