extends Particles

func _ready():
	set_process(true)

func _process(delta):
	var rot = Vector3(rand_range(0, 360), rand_range(0, 360), rand_range(0, 360))
	rotation_degrees = rot
