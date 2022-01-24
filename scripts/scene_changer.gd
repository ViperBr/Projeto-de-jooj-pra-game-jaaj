extends CanvasLayer

onready var animation = $Control/AnimationPlayer

var scene : String;

var data 
var path

func change_scene(new_scene, anim, data=Vector2(62,278), savepath="user://saves/save1.dat"):
	scene = new_scene
	animation.play(anim)
	data = data
	path = savepath

func new_scene():
	get_tree().change_scene(scene)

