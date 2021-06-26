extends Camera
var t = 0;
var mouseDelta : Vector2 = Vector2()
var lookSensitivity : float = 0.05
var minLookAngle : float = -5.0
var maxLookAngle : float = 0.0
var camera_dist = 10*Vector3(1,1,1)
var camera_height = Vector3(0,10,0)
var camTo = Vector3(0,0,0)
var panTo = Vector3(0,0,0)
var camSpeed : float = 0.02
var rng = RandomNumberGenerator.new()

onready var viewport = get_viewport()
onready var player = get_parent()

var shakeY : float = 0.0
var shakeX : float = 0.0
var shakeZ : float = 0.0
#shake params
var shakeAmount : float = 0.0
var shakeSpeed : float = 3000.0
var shakeDecay : float = 0.1
var shakeMin : float = 0.6
var shakeMax : float = 0.7

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()

# called when an input is detected
func _input (event):
	pass
	# did the mouse move?
	#if event is InputEventMouseMotion:
	#	mouseDelta = event.position - viewport.size/2
		
	#did you press the mb_left?
	#if event is InputEventMouseButton:
	#	shakeStart()

func shakeStart():
	shakeAmount = rng.randf_range(shakeMin, shakeMax)

func shakeDecay(delta):
	if (shakeAmount > 0):
		shakeAmount -= shakeDecay*delta

func shake(t_in):
	#shake (these are poorly named)
	shakeX = sin(shakeSpeed*t_in)
	shakeY = sin(shakeSpeed*t_in)
	shakeZ = sin(shakeSpeed*t_in)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	#shake time
	t += delta*.01
	
	shakeDecay(delta)
	
	shake(t)
	
	var aim = player.get_global_transform().basis
	panTo = panTo.linear_interpolate(aim.z,camSpeed)
	camTo = camTo.linear_interpolate(player.transform.origin,camSpeed)
	transform.origin = camTo + panTo * camera_dist  + camera_height
	look_at_from_position(transform.origin + shakeAmount*Vector3(shakeX,shakeY,shakeZ),player.transform.origin,Vector3(0,1,0))
