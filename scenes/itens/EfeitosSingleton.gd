extends Node


export(AudioStreamSample) var paper_sound
export(AudioStreamSample) var pistol

func play_pistol():
	$efeito.set_stream(pistol)
	$efeito.play()
	
func play_paper():
	$efeito.set_stream(paper_sound)
	$efeito.play()

func play_broken_glass():
	$vidro_quebrando.play()

func play_pistol_delay(delay):
	var timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(delay)
	add_child(timer)
	timer.connect("timeout",self,"play_pistol")
	timer.start()

func play_broken_glass_delay(delay):
	var timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(delay)
	add_child(timer)
	timer.connect("timeout",self,"play_broken_glass")
	timer.start()
