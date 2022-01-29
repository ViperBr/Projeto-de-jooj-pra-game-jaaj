extends Node2D

var path
var selected = false;
var taked_weapon = false;
var rest_point
var rest_nodes = []
var data

#func _ready():
#	path = SceneChanger.path	
#	rest_nodes = get_tree().get_nodes_in_group("zone")
#	rest_point = rest_nodes[0].global_position
#	var file = File.new()
#	if file.file_exists(path):
#		var error = file.open(path,File.READ)
#		if error == OK:
#			data = file.get_var()
#			rest_point = data.weapon_position
#			file.close()
#


onready var my_turn:bool
onready var initial_position
const SPEED = 25


func _ready():
	my_turn = true
	initial_position = position
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[0].global_position
	$roleta.hide()
	$seta.hide()

func set_sombra_shot():
	if not my_turn:
		get_node("/root/inicio_do_jogo").sombra_is_shooting()
		my_turn = true

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
		$AnimatedSprite.hide()
		$roleta.show()
		$seta.show()
		if $roleta.rotation_degrees < 360:
			$roleta.rotation_degrees += 6
		else:
			$roleta.rotation_degrees = 0

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:

			selected = false
			var shortest_dist = 100
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)

				if distance <= shortest_dist and child.name == "get_weapon" and my_turn:
					taked_weapon = true;
					initial_position = child.global_position
					return
				elif distance <= shortest_dist:
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
			print_debug("BANG levou um tiro")
			set_dead();
	$AnimatedSprite.show()
	$roleta.hide()
	$seta.hide()
	global_position = Vector2(1413,777)
	
