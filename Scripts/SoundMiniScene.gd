extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _start_background_music():
	$BackgroundMusic.play()

func _stop_background_music():
	$BackgroundMusic.stop()

func _play_game_over_sound():
	$GameOverSound.play()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BackgroundMusic_finished():
	$BackgroundMusic.play()
