extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var finalScore = 0


func _set_final_score(score):
	self.finalScore = score

func _get_final_score():
	return self.finalScore

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
