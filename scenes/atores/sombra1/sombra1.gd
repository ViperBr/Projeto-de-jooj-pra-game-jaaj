extends Node2D




func play_putting_mask_animation():
	$AnimatedSprite.play("pondo_mascara")

func can_i():
	$AnimatedSprite.play("not")

func set_animation_shooting():
	$AnimatedSprite.frame = 0
	$AnimatedSprite.play("shooting")


func _ready():
	$AnimatedSprite.playing = false
	$"AnimatedSprite".play("comeco")

func set_animation_shooting_and_dead():
	$AnimatedSprite.play("shooting_and_dead")
	EfeitosSingleton.play_pistol_delay(1.5)
	

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "shooting_and_dead":
		get_node("/root/inicio_do_jogo").removing()
