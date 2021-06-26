extends Spatial
var tank = preload("res://tank.tscn")
var count = 0
signal player_position(position)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_CSGBox_enemy_died():
	count += 1
	var randx = rand_range(-50,50)
	var randz = rand_range(-50,50)
	if (count % 2 == 0):
		var tankInstance = tank.instance()
		self.add_child(tankInstance)
		tankInstance.transform.origin = transform.origin + Vector3(randx, 0, randz)
		self.connect("player_position",tankInstance,"receive_player_position")


func _on_CSGBox_player_position(position):
	emit_signal("player_position",position)
