extends CSGMesh
var rng = RandomNumberGenerator.new()

var meshPaths = [
			"res://models/terrain/building1.mesh",
			"res://models/terrain/building2.mesh",
			"res://models/terrain/building3.mesh",
			"res://models/terrain/smBuilding1.mesh",
			"res://models/terrain/smBuilding2.mesh"
			]
			
var matPaths = [
			"res://models/terrain/building1_mtl.material",
			"res://models/terrain/building2_mtl.material",
			"res://models/terrain/building3_mtl.material",
			"res://models/terrain/smBuilding1_mtl.material",
			"res://models/terrain/smBuilding2_mtl.material"
			]
			
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var myMeshIndex = rng.randi_range(0,4)
	set_mesh(load(meshPaths[myMeshIndex]))
	set_material(load(matPaths[myMeshIndex]))
