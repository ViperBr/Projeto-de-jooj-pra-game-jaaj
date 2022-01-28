extends Area2D


onready var mouse_is_inside:bool

func _on_notebook_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if VariableSingleton.is_notebook_opened:
			return
		else:
			VariableSingleton.is_notebook_opened = true
			$AnimatedSprite.play("opening")


func _on_notebook_mouse_entered():
	mouse_is_inside = true


func _on_notebook_mouse_exited():
	mouse_is_inside = false
	var timer = Timer.new()
	add_child(timer)
	timer.set_autostart(true)
	timer.set_one_shot(true)
	timer.set_wait_time(0.5)
	timer.connect("timeout",self,"_on_timer_timeout")
	timer.start()
	
func _on_timer_timeout():
	$AnimatedSprite.play("closing")
	VariableSingleton.is_notebook_opened = false
