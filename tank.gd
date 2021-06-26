extends KinematicBody
onready var player = get_node("res://scenes/Arena/Tankdozer.tscn")
var target = Vector3(0,0,0);
var speed = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#var aim = get_global_transform().basis
	#var forward = -10 *aim.z
	var dir = (target - transform.origin).normalized()
	var collision = move_and_collide(dir * speed * delta)

func receive_player_position(position):
	target = position


func _on_CSGBox_player_position(position):
	target = position
