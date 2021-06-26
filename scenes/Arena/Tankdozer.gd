extends KinematicBody

signal enemy_died()
signal player_position(position)
var smoking = preload("res://scenes/smoking.tscn")
onready var camera: Camera = $Camera
onready var viewport := get_viewport()
var isSmoking = false;
#SIGNALS
signal steer_signal(direction)
signal health_signal(health)
signal goToRoom(room)

const SPEED: float = 20.0
const STEER_SPEED: float = 1.5
var look_sensitivity := 0.005

enum GearShift {
	FORWARD, REVERSE
}

var shift_position = GearShift.FORWARD

var hp := 100.0

var mouseDelta := Vector2.ZERO

var velocity := Vector3.FORWARD

# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("steer_signal",shift_position) #technically these only need to be emitted on change, but whatever
	emit_signal("health_signal",hp) 

func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		mouseDelta = event.position - viewport.size / 2
	
	# if event is InputEventMouseButton:
		# shift_position = posmod(shift_position + 1, GearShift.size())

func _process(_delta: float):
	if Input.is_action_just_pressed("shift_gear"):
		shift_position = posmod(shift_position + 1, GearShift.size())
		emit_signal("steer_signal",shift_position) #technically these only need to be emitted on change, but whatever

func _physics_process(delta: float):
	rotation -= (Vector3(0, mouseDelta.x, 0) - transform.basis.y) * look_sensitivity * delta
	var aim = get_global_transform().basis
	
	var speed = -SPEED if shift_position == GearShift.REVERSE else SPEED
	var forward = speed * aim.z
	var collision = move_and_collide(forward * delta)
	emit_signal("player_position",transform.origin)

	if collision:
		if collision.collider.has_method("die"):
			$Camera.shakeStart()
			collision.collider.die()
			emit_signal("enemy_died")
			hp -= collision.collider.damage
			emit_signal("health_signal",hp) #move this to health change
			if (hp < 50) and !isSmoking:
				add_child(smoking.instance())
				isSmoking = true;
				
	if (hp < 0):
		#get_tree().change_scene("res://gameover.tscn")
		emit_signal("goToRoom","gameover")

