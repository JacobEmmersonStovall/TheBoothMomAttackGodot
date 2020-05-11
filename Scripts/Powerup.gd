extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var funcToCall = "_on_baseball_pickup"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("body_entered", self, "_on_powerup_body_entered")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_powerup_body_entered(body):
	if "Player" in body.name:

		get_tree().get_root().get_node("World").call(self.funcToCall)
		queue_free()
