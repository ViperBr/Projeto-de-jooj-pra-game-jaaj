extends Node2D


onready var stopped_fade:bool= false
onready var can_die:bool = false
onready var dead:bool= false

onready var pode_tocar_animacao_de_atirar_sem_morrer:bool= true

func _ready():
	$AnimatedSprite.play("sem_mascara")
	$fade.play("fade")

func play_colocar_mascara():
	$AnimatedSprite.play("pondo_mascara")

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != "toma_bala" and stopped_fade:
		if not dead and pode_tocar_animacao_de_atirar_sem_morrer:
			$AnimatedSprite.play("parado")
			
	if $AnimatedSprite.animation == "toma_bala":
		get_node("/root/inicio_do_jogo").data.character += 1
		get_node("/root/inicio_do_jogo").data.dialog = 1
		get_node("/root/inicio_do_jogo").removing()
		get_node("/root/inicio_do_jogo").save_state()
		
	if $AnimatedSprite.animation == "toma_bala_sem_morrer":
		pode_tocar_animacao_de_atirar_sem_morrer = true

func set_animation_shooting():
	#if not dead:
	$AnimatedSprite.play("toma_bala_sem_morrer")
	#pode_tocar_animacao_de_atirar_sem_morrer = false

func set_animation_shooting_and_dead():
	if not dead:
		$AnimatedSprite.play("toma_bala")
		EfeitosSingleton.play_pistol_delay(1)
		dead = true
func set_stopped_fade_to_true():
	stopped_fade = true
	
func sombra5_pode_morrer():
	can_die = true
	set_animation_shooting_and_dead()
