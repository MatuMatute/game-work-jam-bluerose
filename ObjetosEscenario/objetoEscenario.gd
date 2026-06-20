class_name ObjetoEscenario extends Area2D

var pista : Pista = preload("uid://daqum432qyjnw")

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	VariablesJugador.AgregarPista(pista)
	print("Ahora acercar al objeto, pensandolo puede ser de dos maneras que voy a explicar mas adelante")
