extends Label
var rng = RandomNumberGenerator.new()
var phrases = ["cool","rad","amazing","wow","nice"]

# Called when the node enters the scene tree for the first time.
func _ready():
	var phraseIndex = rng.randi_range(0,4)
	text = phrases[phraseIndex]

func _on_Control_enemy_died():
	var phraseIndex = rng.randi_range(0,4)
	text = phrases[phraseIndex]
