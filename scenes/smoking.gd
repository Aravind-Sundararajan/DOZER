extends Spatial

var passed_time : float = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	passed_time += delta
	if (passed_time > 10):
		queue_free()
