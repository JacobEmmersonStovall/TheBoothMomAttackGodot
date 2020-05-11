extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _enter_tree():
	var score = global._get_final_score()
	$Label2.set_text("Score: " + str(score))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	if Input.is_key_pressed(KEY_R):
		get_tree().change_scene("res://Scenes/StartScreen.tscn")
