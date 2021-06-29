extends AudioStreamPlayer3D

func _ready():
	play()

func _process(delta):
	if(!is_playing()):
		queue_free()
