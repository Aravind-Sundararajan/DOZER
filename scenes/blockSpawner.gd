extends Spatial

var building = preload("res://scenes/cityBlock.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(-3,3):
		for j in range(-3,3):
			var blockInstance = building.instance()
			if (abs(i) + abs(j) > 1):
				self.add_child(blockInstance)
				blockInstance.transform.origin = transform.origin + Vector3(i*70,0, j* 70)
