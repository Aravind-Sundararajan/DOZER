extends Label
var count = 0
signal goToRoom(room)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(count)



func _on_Control_enemy_died():
	count += 1
	text = str(count)
	if (count > 200):
		emit_signal("goToRoom","victory")
