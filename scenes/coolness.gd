extends Label
var rng = RandomNumberGenerator.new()
var phrases = ["cool","rad","amazing","wow","nice","wicked","poggies"]

# Called when the node enters the scene tree for the first time.
func _ready():
	var phraseIndex = rng.randi_range(0,phrases.size()-1)
	text = phrases[phraseIndex]

func _on_Control_enemy_died():
	var phraseIndex = rng.randi_range(0,phrases.size()-1)
	text = phrases[phraseIndex]
