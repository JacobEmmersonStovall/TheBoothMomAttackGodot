extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playStarted = true


# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayBallAudio/AudioStreamPlayer2D.connect("finished", self, "_on_PlayBallAudio_finished")
	playStarted = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if Input.is_key_pressed(KEY_ENTER):
		self._on_PlayGameButton_pressed()


func _on_PlayGameButton_pressed():
	if !playStarted:
		$BoothTitleImageNode/BoothTitleImage.play("Flashing")
		$PlayBallAudio/AudioStreamPlayer2D.play()
		playStarted = true

func _on_PlayBallAudio_finished():
	$BoothTitleImageNode/BoothTitleImage.play("Idle")
	playStarted = false
	get_tree().change_scene("res://Scenes/LevelOne.tscn")
