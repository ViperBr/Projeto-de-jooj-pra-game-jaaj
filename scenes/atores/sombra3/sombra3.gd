extends Node2D


onready var stopped_fade:bool=false
onready var can_die:bool = false
onready var started_gun_animation:bool = false

var dead:bool=false


func _ready():
	$AnimatedSprite.play("sem_mascara")
	$fade.play("fade")

func play_colocar_mascara():
	$AnimatedSprite.play("pondo_mascara")

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != "parado" and $AnimatedSprite.animation != "atirando_morrendo" and $AnimatedSprite.animation != "olhando_pra_baixo" and stopped_fade:
		if not started_gun_animation and not dead:
			$AnimatedSprite.play("parado")
			
	if $AnimatedSprite.animation == "morre_3_balas":
		get_node("/root/inicio_do_jogo").data.character += 1
		get_node("/root/inicio_do_jogo").removing()
		print_debug("chamando removing")
		

func set_animation_shooting():
	if not can_die:
		$AnimatedSprite.play("pondo_3_balas")
		started_gun_animation = true

func set_animation_shooting_and_dead():
	if not dead:
		$AnimatedSprite.play("morre_3_balas")
		dead = true
	
func set_stopped_fade_to_true():
	stopped_fade = true
	
func sombra3_pode_morrer():
	can_die = true
	set_animation_shooting_and_dead()
