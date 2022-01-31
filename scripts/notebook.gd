extends Area2D


onready var mouse_is_inside:bool

func _ready():
	$"Notificacao-caderno".visible = VariableSingleton.is_there_something_new




func _on_notebook_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if VariableSingleton.is_notebook_opened:
			return
		else:
			VariableSingleton.is_notebook_opened = true
			VariableSingleton.is_notebook_interface_visible = true
			EfeitosSingleton.play_paper()
			$AnimatedSprite.play("opening")


func _on_notebook_mouse_entered():
	mouse_is_inside = true
	pass

onready var count = 0

func _process(delta):
	if VariableSingleton.is_there_something_new:
		$"Notificacao-caderno".visible = VariableSingleton.is_there_something_new
	else:
		$"Notificacao-caderno".visible = VariableSingleton.is_there_something_new
	
	if not VariableSingleton.is_notebook_interface_visible and count == 0 and VariableSingleton.is_back_button_pressed:
		var timer = Timer.new()
		add_child(timer)
		timer.set_one_shot(true)
		timer.set_wait_time(0.5)
		timer.connect("timeout",self,"_on_timer_timeout")
		timer.start()
		count += 1
		
		
	
func _on_notebook_mouse_exited():
	pass
	
func _on_timer_timeout():
	$AnimatedSprite.play("closing")
	VariableSingleton.is_notebook_opened = false
	VariableSingleton.is_back_button_pressed = false
	count = 0
	
