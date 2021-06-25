extends Camera
var time_passed : float = 0.0 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_passed += delta
	transform.origin = Vector3(0,10*sin(time_passed/TAU),0)
