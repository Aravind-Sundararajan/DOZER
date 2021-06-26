extends Spatial
var damage = 0.0
var splosion = preload("res://scenes/esplosion.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func die():
	get_parent().add_child(splosion.instance())
	get_parent().get_node("DeathSoundEffect").play()
	hide()
	#yield($DeathSoundEffect, "finished")
	queue_free()
