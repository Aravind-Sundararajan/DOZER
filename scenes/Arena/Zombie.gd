extends RigidBody
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hp := 100.0
var dying := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# func _physics_process(delta):
# 	pass

func take_damage(amount: float):
	hp = clamp(hp - amount, 0, 100)

func die():
	if !dying:
		dying = true
		$DeathSoundEffect.play()
		hide()
		yield($DeathSoundEffect, "finished")
		queue_free()
