extends Node
var rooms = {
	"titlecard" : preload("res://scenes/titlecard.tscn"),
	"arena" : preload("res://scenes/Arena/Arena.tscn"),
	"options" : preload("res://scenes/options.tscn"),
	"gameover" : preload("res://scenes/gameover.tscn"),
	"victory" : preload("res://scenes/victory.tscn")
}
var goToRoom = rooms["titlecard"]
# Called when the node enters the scene tree for the first time.
func _ready():
	$currentScene.get_child(0).connect("goToRoom",self,"on_goToRoom")
	$transition.get_node("AnimationPlayer").play("fade_to_normal")

func _on_transition_transitioned():
	$currentScene.get_child(0).queue_free()
	var newRoom = goToRoom.instance()
	newRoom.connect("goToRoom",self,"on_goToRoom")
	$currentScene.add_child(newRoom)
	
func on_goToRoom(room):
	goToRoom= rooms[room]
	$transition.transition()
