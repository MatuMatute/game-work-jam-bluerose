class_name ObjetoEscenario extends Area2D

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	print("Ahora acercar al objeto, pensandolo puede ser de dos maneras que voy a explicar mas adelante")
