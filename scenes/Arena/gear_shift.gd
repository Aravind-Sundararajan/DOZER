extends VSlider
var myDirection : float = 0.0
var duration : float = 2 #seconds
var elapsed_time : float = 0.0 #seconds

const c4 = TAU / 3.0;

func _ready():
	$AudioGearShift.play()

func _process(_delta: float):
	elapsed_time+= _delta
	value = linterp(value,myDirection,easeInOut(elapsed_time/duration))
	
func _on_Control_steer_change(direction):
	elapsed_time = 0
	myDirection = direction
	$AudioGearShift.play()
	
	
	
func linterp(start_value, end_value, pct):
	return (start_value + (end_value - start_value) * pct);

func flip(x):
	return 1-x

func ease_in(t):
	return t * t
	
func ease_out(t):
	return flip(flip(t) * flip(t))

func easeInOut(t):
	return linterp(ease_in(t),ease_out(t),t)
