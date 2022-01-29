extends Node2D


onready var stopped_fade:bool=false
onready var can_die:bool = false


func _ready():
	print_debug("Fui instanciado caraio")
	$AnimatedSprite.play("sem_mascara")
	$fade.play("fade")

func play_colocar_mascara():
	$AnimatedSprite.play("pondo_mascara")

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != "parado" and $AnimatedSprite.animation != "atirando_morrendo" and $AnimatedSprite.animation != "olhando_pra_baixo" and stopped_fade:
		$AnimatedSprite.play("parado")

func set_animation_shooting():
	if can_die:
		set_animation_shooting_and_dead()
	else:
		$AnimatedSprite.play("pondo_3_balas")

func set_animation_shooting_and_dead():
	$AnimatedSprite.play("morre_3_balas")
	get_node("/root/inicio_do_jogo").removing()
	
func set_stopped_fade_to_true():
	stopped_fade = true
	
	
func sombra3_ultimo_dialogo():
	can_die = true
