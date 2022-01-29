extends Node2D


var stopped_fade:bool=false



func _ready():
	$AnimatedSprite.play("sem_mascara")
	$fade.play("fade")

func play_colocar_mascara():
	$AnimatedSprite.play("pondo_mascara")

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != "parado" and $AnimatedSprite.animation != "atirando_morrendo" and $AnimatedSprite.animation != "olhando_pra_baixo" and stopped_fade:
		$AnimatedSprite.play("parado")

func set_animation_shooting():
	set_animation_shooting_and_dead()

func set_animation_shooting_and_dead():
	$AnimatedSprite.play("atirando_morrendo")
	get_node("/root/inicio_do_jogo").removing()
	
func set_stopped_fade_to_true():
	stopped_fade = true
