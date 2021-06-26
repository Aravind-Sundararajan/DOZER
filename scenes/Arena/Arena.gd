extends Spatial

signal goToRoom(room)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_CSGBox_goToRoom(room):
	emit_signal("goToRoom",room)

func _on_Control_goToRoom(room):
	emit_signal("goToRoom",room)
