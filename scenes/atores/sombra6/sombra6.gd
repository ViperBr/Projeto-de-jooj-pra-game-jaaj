extends Node2D


onready var stopped_fade:bool=false
onready var can_die:bool = false
onready var started_gun_animation:bool = false
onready var dead:bool = false
onready var pode_tocar_animacao_de_atirar_sem_morrer:bool = true
func _ready():
	$AnimatedSprite.play("comeco")
	$fade.play("fade")
	

func play_colocar_mascara():
	$AnimatedSprite.play("pondo_mascara")

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != "toma_bala" and stopped_fade:
		if not dead and pode_tocar_animacao_de_atirar_sem_morrer:
			$AnimatedSprite.play("parado")
			
	#if $AnimatedSprite.animation == "morre_3_balas":
	#	get_node("/root/inicio_do_jogo").removing()

func set_animation_shooting():
	return

func set_animation_shooting_and_dead():
	return
	#$AnimatedSprite.play("morre_3_balas")
	
	
func set_stopped_fade_to_true():
	stopped_fade = true
	
	

func sombra6_se_mata():
	$AnimatedSprite.play("toma_bala")

func sombra6_atira_espelho():
	$AnimatedSprite.play("atira_espelho")
	
func sombra6_guarda_arma():
	return
