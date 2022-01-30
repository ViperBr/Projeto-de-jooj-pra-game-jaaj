extends Node2D


onready var stopped_fade:bool=false
onready var can_die:bool = false
onready var started_gun_animation:bool = false
onready var dead:bool = false

onready var timer_fim_do_jogo

func _ready():
	$AnimatedSprite.play("comeco")
	$fade.play("fade")
	
	timer_fim_do_jogo = Timer.new()
	timer_fim_do_jogo.set_wait_time(3)
	timer_fim_do_jogo.set_one_shot(true)
	add_child(timer_fim_do_jogo)
	timer_fim_do_jogo.connect("timeout",self,"fim_do_jogo")
	

func play_colocar_mascara():
	$AnimatedSprite.play("pondo_mascara")

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation != "toma_bala" and stopped_fade:
		if not dead:
			$AnimatedSprite.play("parado")
			
func set_animation_shooting():
	return

func set_animation_shooting_and_dead():
	return
	#$AnimatedSprite.play("morre_3_balas")
	
func set_stopped_fade_to_true():
	stopped_fade = true

func sombra6_se_mata():
	dead = true
	$AnimatedSprite.play("toma_bala")
	VariableSingleton.sombra6_weapon_visible = false
	timer_fim_do_jogo.start()
	
func sombra6_atira_espelho():
	$AnimatedSprite.play("atira_espelho")
	VariableSingleton.sombra6_weapon_visible = false
	timer_fim_do_jogo.start()
func sombra6_guarda_arma():
	VariableSingleton.sombra6_weapon_visible = true
	timer_fim_do_jogo.start()
	
func fim_do_jogo():
	SceneChanger.change_scene("res://scenes/fases/fim_do_game.tscn")
