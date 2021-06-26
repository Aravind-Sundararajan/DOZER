extends AudioStreamPlayer3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	play()

func _process(delta):
	if(!is_playing()):
		queue_free()
