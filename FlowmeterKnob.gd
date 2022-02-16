extends Sprite

signal moveball(meterposition)
var event
export var max_radius:float 

func _input(event):
	if event is InputEventMouseMotion:
		var motion = event.relative
		var new_pos = get_global_mouse_position()
		var prev_pos = new_pos - motion
		var center = get_global_position()
		var angle = (prev_pos - center).angle_to(new_pos - center)
		if (new_pos - center).length() < max_radius:
			rotate(angle)
		else:
			pass
			
	
func _physics_process(delta: float) -> void:
	_input(event)
	self.rotation_degrees = clamp(self.rotation_degrees, -330,0)
	var turned = self.rotation_degrees
	var meterposition
	if turned == 0:
		meterposition = 0
	else:
		meterposition = turned/-330
	print(meterposition)
	emit_signal("moveball", meterposition)
	
