extends Node2D


onready var stopped_fade:bool=false
onready var can_die:bool = false

onready var dead:bool=false

func _ready():
	$AnimatedSprite.play("normal")
	$fade.play("fade")

func play_colocar_mascara():
	$AnimatedSprite.play("pondo_mascara")

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != "atirando_morrendo" and $AnimatedSprite.animation != "olhando_pra_baixo" and $AnimatedSprite.animation != "toma_bala" and stopped_fade:
		if not dead:
			$AnimatedSprite.play("parado")
			
	if $AnimatedSprite.animation == "toma_bala":
		get_node("/root/inicio_do_jogo").data.character += 1
		$fade.play("fade_out")
		get_node("/root/inicio_do_jogo").removing()
		get_node("/root/inicio_do_jogo").save_state()
		print_debug("chamando removing")
		
func set_animation_shooting():
	return

func set_animation_shooting_and_dead():
	$AnimatedSprite.play("toma_bala")
		
func set_stopped_fade_to_true():
	stopped_fade = true
	
func sombra4_pode_morrer():
	can_die = true
	set_animation_shooting_and_dead()
