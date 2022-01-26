extends Node2D


func _ready():
	$"AnimatedSprite".play("comeco")

func _start_animation():
	$fade_in.play()

func play_putting_mask_animation():
	$AnimatedSprite.play("pondo_mascara")

