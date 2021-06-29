extends Spatial
var building = preload("res://scenes/building.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(5):
		for j in range(5):
			var buildingInstance = building.instance()
			self.add_child(buildingInstance)
			buildingInstance.transform.origin = transform.origin + Vector3(i*12,0, j* 12)
