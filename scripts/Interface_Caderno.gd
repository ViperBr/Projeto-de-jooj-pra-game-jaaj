extends Control

func _ready():
	hide()
	get_node("fotos/foto1").visible = false
	get_node("fotos/foto2").visible = false
	get_node("fotos/foto3").visible = false
	get_node("fotos/foto4").visible = false
	get_node("fotos/foto5").visible = false


onready var foto1:bool=false
onready var foto2:bool=false
onready var foto3:bool=false
onready var foto4:bool=false
onready var foto5:bool=false



var count1 = 0
var count2 = 0
var count3 = 0
var count4 = 0
var count5 = 0

func _process(delta):
	if VariableSingleton.is_notebook_interface_visible:
		show()
		VariableSingleton.is_there_something_new = false
	else:
		hide()
	
	if VariableSingleton.character == 1:
		if count1 == 0:
			get_node("fotos/foto1").visible = true
			VariableSingleton.is_there_something_new = true
			count1 += 1
	if VariableSingleton.character == 2:
		if count2 == 0:
			get_node("fotos/foto2").visible = true
			VariableSingleton.is_there_something_new = true
			count2 += 1
	if VariableSingleton.character == 3:
		if count3 == 0:
			get_node("fotos/foto3").visible = true
			VariableSingleton.is_there_something_new = true
			count3 += 1
	if VariableSingleton.character == 4:
		if count4 == 0:
			get_node("fotos/foto4").visible = true
			VariableSingleton.is_there_something_new = true
			count4 += 1
	if VariableSingleton.character == 5:
		if count5 == 0:
			get_node("fotos/foto5").visible = true
			VariableSingleton.is_there_something_new = true
			count5 += 1




func _on_Voltar_pressed():
	VariableSingleton.is_notebook_interface_visible = false
	VariableSingleton.is_back_button_pressed = true


