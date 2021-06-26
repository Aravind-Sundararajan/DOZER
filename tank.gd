extends KinematicBody
onready var player = get_node("res://scenes/Arena/Tankdozer.tscn")
var splosion = preload("res://scenes/esplosion.tscn")

var target = Vector3(0,0,0);
var currentTarget = Vector3(0,0,0);
var speed = 10
var damage = 10.0
# Called when the node enters the scene tree for the first time.
func _ready():
	$EngineSound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#var aim = get_global_transform().basis
	#var forward = -10 *aim.z
	var dir = (target - transform.origin).normalized()
	currentTarget = target#currentTarget.linear_interpolate(target,delta)
	look_at(currentTarget, Vector3(0,1,0))
	var collision = move_and_collide(dir * speed * delta)

func receive_player_position(position):
	target = position

func _on_CSGBox_player_position(position):
	print(target)
	target = position

func die():
	get_parent().add_child(splosion.instance())
	#$DeathSoundEffect.play()
	#hide()
	queue_free()
