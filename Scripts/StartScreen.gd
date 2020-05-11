extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playStarted = true


# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayGameButton.connect("button_up", self, "_on_PlayGameButton_pressed")
	$PlayBallAudio/AudioStreamPlayer2D.connect("finished", self, "_on_PlayBallAudio_finished")
	$ExitGameButton.connect("button_up", self, "_on_ExitGameButton_pressed")
	$PlayGameButton.grab_focus()
	playStarted = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()


func _on_PlayGameButton_pressed():
	if !playStarted:
		$BoothTitleImageNode/BoothTitleImage.play("Flashing")
		$PlayBallAudio/AudioStreamPlayer2D.play()
		playStarted = true

func _on_PlayBallAudio_finished():
	$BoothTitleImageNode/BoothTitleImage.play("Idle")
	playStarted = false
	get_tree().change_scene("res://Scenes/LevelOne.tscn")

func _on_ExitGameButton_pressed():
	get_tree().quit()
