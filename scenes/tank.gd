extends KinematicBody

class_name Tank

onready var player = get_node("res://scenes/Arena/Tankdozer.tscn")
var splosion = preload("res://scenes/esplosion.tscn")
var deathSound = preload("res://scenes/deathSound.tscn")
var target = Vector3(0,0,0);
var currentTarget = Vector3(0,0,0);
var speed = 19
var damage = 10.0
# Called when the node enters the scene tree for the first time.
func _ready():
	$EngineSound.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var dir = (target - transform.origin).normalized()
	currentTarget = target
	look_at(currentTarget, Vector3(0,1,0))
	var collision = move_and_collide(dir * speed * delta)

func receive_player_position(position):
	target = position

func _on_CSGBox_player_position(position):
	target = position

func die():
	var explosion = splosion.instance()
	get_parent().add_child(explosion)
	explosion.transform.origin = transform.origin
	
	var mySound = deathSound.instance()
	get_parent().add_child(mySound)
	queue_free()
