extends Camera
var time_passed : float = 0.0 
onready var dozer = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_passed += delta
	transform.origin = Vector3(-30,20*sin(time_passed/TAU),-30)
	look_at(dozer.transform.origin, Vector3(0,1,0))
