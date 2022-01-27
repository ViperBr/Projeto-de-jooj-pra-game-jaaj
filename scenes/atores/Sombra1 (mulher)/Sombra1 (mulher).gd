extends Node2D


func _ready():
	$"AnimatedSprite".play("comeco")

func play_putting_mask_animation():
	$AnimatedSprite.play("pondo_mascara")

func can_i():
	print_debug("não")
	$AnimatedSprite.play("not")
