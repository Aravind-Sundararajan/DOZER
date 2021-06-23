extends Control

signal health_change(health)
signal steer_change(direction)

func _on_CSGBox_health_signal(health):
	emit_signal("health_change",health)

func _on_CSGBox_steer_signal(direction):
	emit_signal("steer_change",direction)

func _ready():
	$AudioEngine.play()
