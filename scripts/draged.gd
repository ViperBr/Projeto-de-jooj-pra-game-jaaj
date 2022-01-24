extends Node2D

var path
var selected = false;
var rest_point
var rest_nodes = []
var data

func _ready():
	path = SceneChanger.path	
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[0].global_position
#	rest_nodes[0].select()
	var file = File.new()
	if file.file_exists(path):
		var error = file.open(path,File.READ)
		if error == OK:
			data = file.get_var()
			rest_point = data.weapon_position
			file.close()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true;

func _process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta);
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = 100
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance <= shortest_dist:
					rest_point = child.global_position
#					child.select()
					data.weapon_position = rest_point
					var file = File.new()
					file.open(path ,File.WRITE)
					file.store_var(data)
					file.close()
					return
				else:
					rest_point = global_position
					data.weapon_position = rest_point
					var file = File.new()
					print_debug(path)
					file.open(path ,File.WRITE)
					file.store_var(data)
					file.close()
