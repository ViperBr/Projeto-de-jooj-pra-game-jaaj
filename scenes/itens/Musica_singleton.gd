extends Node

export(AudioStreamSample) var musica_menu

export(AudioStreamSample)  var musica_principal

export(AudioStreamSample)  var musica_fim_do_jogo

func play_menu():
	$musica.set_stream(musica_menu)
	$musica.play()
	
func play_principal():
	$musica.set_stream(musica_principal)
	$musica.play()
func play_fim():
	$musica.set_stream(musica_fim_do_jogo)
	$musica.play()
