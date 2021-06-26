extends Node
var rooms = {
	"titlecard" : preload("res://scenes/titlecard.tscn"),
	"arena" : preload("res://scenes/Arena/Arena.tscn"),
	"gameover" : preload("res://gameover.tscn"),
	"victory" : preload("res://victory.tscn")
}
var goToRoom = rooms["titlecard"]
# Called when the node enters the scene tree for the first time.
func _ready():
	$currentScene.get_child(0).connect("goToRoom",self,"on_goToRoom")
	$transition.get_node("AnimationPlayer").play("fade_to_normal")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if Input.is_action_just_pressed("ui_accept"):
#		$transition.transition()

func _on_transition_transitioned():
	$currentScene.get_child(0).queue_free()
	var newRoom = goToRoom.instance()
	newRoom.connect("goToRoom",self,"on_goToRoom")
	$currentScene.add_child(newRoom)
	
func on_goToRoom(room):
	goToRoom= rooms[room]
	$transition.transition()
