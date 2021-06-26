extends Control

signal goToRoom(room)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_goToRoom(room):
	emit_signal("goToRoom",room)
