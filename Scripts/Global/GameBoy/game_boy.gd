extends Node2D

#sounds asset
@onready var first_clic = $Timer/first_clic
@onready var second_clic = $Timer/second_clic
@onready var final_clic = $Timer/final_clic
var sound_array = []
#timer variables
@onready var timer = $Timer
var num_clics = 0
var wait_time 
#total time that you want the level to be
var total_time = 9


func _ready():
	#Array of sounds if we add some there gonna be more alert sounds
	sound_array = [first_clic, second_clic, final_clic]
	
	#Calculate total time that the game designer wants and dividing it into the amount of segment(sounds count)
	wait_time = total_time / sound_array.size()
	
	timer_handler()

func _on_timer_timeout():
	if num_clics < sound_array.size() - 1:
		#play the sound in order
		sound_array[num_clics].play()
		#go to the next sound
		num_clics += 1
		timer_handler()
	else :
		#when the timer is completely done
		final_clic.play()
		#do the flash here and the reset of the camera here

#Can be adding other behavior in the timer
func timer_handler () -> void:
	timer.wait_time = wait_time
	timer.start()
	
	

	
