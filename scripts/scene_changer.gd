extends CanvasLayer

onready var animation = $Control/AnimationPlayer
var scene : String;

func change_scene(new_scene, anim):
	scene = new_scene
	animation.play(anim)

func new_scene():
	get_tree().change_scene(scene)
