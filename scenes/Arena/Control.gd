extends Control

signal enemy_died()
signal health_change(health)
signal steer_change(direction)
signal goToRoom(room)

func _on_CSGBox_health_signal(health):
	emit_signal("health_change",health)

func _on_CSGBox_steer_signal(direction):
	emit_signal("steer_change",direction)

func _on_CSGBox_enemy_died():
	emit_signal("enemy_died")
	
func _ready():
	$AudioEngine.play()


func _on_count_goToRoom(room):
	emit_signal("goToRoom",room)
