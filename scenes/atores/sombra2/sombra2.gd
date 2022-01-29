extends Node2D

func _ready():
	
	$fade.play("fade")
	pass

func play_colocar_mascara():
	$AnimatedSprite.play("pondo_mascara")

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != "parado" and $AnimatedSprite.animation != "atirando_morrendo":
		$AnimatedSprite.play("parado")

func set_animation_shooting():
	$AnimatedSprite.frame = 0
	$AnimatedSprite.play("atirando")

func set_animation_shooting_and_dead():
	$AnimatedSprite.play("atirando_morrendo")
