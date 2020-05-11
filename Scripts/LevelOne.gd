extends Node2D

export var score = 0
export var score_multiplier = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var BaseballPowerup = load("res://MiniScenes/BaseballPowerup.tscn")
var WhipPowerup = load("res://MiniScenes/WhipPowerup.tscn")
var _random = RandomNumberGenerator.new()

func _set_score_label():
	$ScoreLabel.set_text("Score: " + str(self.score))

func _set_score_multiplier_label():
	$MultiplierLabel.set_text("Multiplier: " + str(self.score_multiplier))

func _update_labels():
	self._set_score_label()
	self._set_score_multiplier_label()

func _on_baseball_pickup():
	self.score = self.score + (5 * self.score_multiplier)
	$Mom._increment_speed()
	$BaseballPickupSound.play()
	self._update_labels()

func _on_whip_pickup():
	self.score_multiplier = self.score_multiplier + 1
	$Mom._increment_speedMultiplier()
	$MultiplierTimer.start(10)
	$WhipPickupSound.play()
	self._update_labels()

func _enter_tree():
	SoundMiniScene._start_background_music()
	self._random.randomize()
	self.score = 0
	self.score_multiplier = 1
	self._update_labels()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_PowerupTimer_timeout():
	var spawnNum = self._random.randi_range(1,20)
	var powerupInstance
	if spawnNum < 18:
		powerupInstance = self.BaseballPowerup.instance()
	else:
		powerupInstance = self.WhipPowerup.instance()
	powerupInstance.set_position(Vector2(self._random.randf_range(8, 240), self._random.randf_range(8, 220)))
	self.add_child(powerupInstance)
	$PowerupTimer.start(self._random.randi_range(1, 5))


func _on_MultiplierTimer_timeout():
	$Mom._reset_speedMultiplier()
	self.score_multiplier = 1
	self._update_labels()

func _on_game_over():
	SoundMiniScene._play_game_over_sound()
	SoundMiniScene._stop_background_music()
	global._set_final_score(self.score)
	get_tree().change_scene("res://Scenes/GameOver.tscn")
