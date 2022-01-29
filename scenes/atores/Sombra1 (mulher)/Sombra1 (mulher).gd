extends Node2D


func _ready():
	$AnimatedSprite.playing = false
	$"AnimatedSprite".play("comeco")

func play_putting_mask_animation():
	$AnimatedSprite.play("pondo_mascara")

func can_i():
	$AnimatedSprite.play("not")

func set_animation_shooting():
	$AnimatedSprite.frame = 0
	$AnimatedSprite.play("shooting")
	
func set_animation_shooting_and_dead():
	$AnimatedSprite.play("shooting_and_dead")
