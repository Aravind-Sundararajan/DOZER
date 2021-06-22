extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var camera: Camera = $Camera
onready var viewport := get_viewport()

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
	pass # Replace with function body.

func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		mouseDelta = event.position - viewport.size / 2
	
	# if event is InputEventMouseButton:
		# shift_position = posmod(shift_position + 1, GearShift.size())

func _process(_delta: float):
	if Input.is_action_just_pressed("shift_gear"):
		shift_position = posmod(shift_position + 1, GearShift.size())

func _physics_process(delta: float):
	rotation -= (Vector3(0, mouseDelta.x, 0) - transform.basis.y) * look_sensitivity * delta
	var aim = get_global_transform().basis
	
	var speed = -SPEED if shift_position == GearShift.REVERSE else SPEED
	var forward = speed * aim.z
	var collision = move_and_collide(forward * delta)

	if collision != null:
		print(collision.collider)
		
		if collision.collider.has_method("die"):
			$Camera.shakeStart()
			collision.collider.die()

	# var mouse_position = get_viewport().get_mouse_position() - get_viewport().get_visible_rect().size / 2
	# var to_move = global_transform.basis.z * SPEED
	# # godot's coordinate system has downwards y as positive. cringe
	# mouse_position = Vector2(mouse_position.x, -mouse_position.y)
	
	# var _projected = camera.project_local_ray_normal(mouse_position)
	# var dropPlane = Plane.PLANE_XZ
	# var _position3d = dropPlane.intersects_ray(
	# 	camera.project_ray_origin(mouse_position),
	# 	camera.project_ray_normal(mouse_position)
	# )
	
	# var angle = atan2(mouse_position.y, mouse_position.x) - TAU / 4
	# velocity = to_move.rotated(Vector3.UP, angle)
	
	# var collision = move_and_collide(velocity * SPEED  * delta, false)
	
	
	# rotation += Vector3(
	# 	0,
	# 	angle * delta,
	# 	0
	# )
	
	#rotation -= Vector3(
	#	0,
	#	atan2(position3d.z, position3d.x) * delta,
	#	0
	#)
	
	#move_and_slide(position3d).rotated(Vector3.UP, angle)
	
	#move_toward(steering, )
	#print("Angle", (atan2(mouse_position.y, mouse_position.x) + TAU / 4) * delta * 0.5)
	
	#print("Mouse Position: ", mouse_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

