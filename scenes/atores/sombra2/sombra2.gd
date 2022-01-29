extends Node2D


var stopped_fade:bool=false



func _ready():
	$AnimatedSprite.play("sem_mascara")
	$fade.play("fade")
	pass

func play_colocar_mascara():
	$AnimatedSprite.play("pondo_mascara")

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != "parado" and $AnimatedSprite.animation != "atirando_morrendo" and $AnimatedSprite.animation != "olhando_pra_baixo" and stopped_fade:
		$AnimatedSprite.play("parado")
		
	if $AnimatedSprite.animation == "atirando_morrendo":
		get_node("/root/inicio_do_jogo").removing()
		print_debug("chamado o removing")

func set_animation_shooting():
	$AnimatedSprite.frame = 0
	$AnimatedSprite.play("atirando")

func set_animation_shooting_and_dead():
	$AnimatedSprite.play("atirando_morrendo")
	
func quem_e_peace():
	$AnimatedSprite.play("olhando_pra_baixo")
	
func set_stopped_fade_to_true():
	stopped_fade = true
