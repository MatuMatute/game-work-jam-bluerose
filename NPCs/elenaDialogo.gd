class_name Elena extends NPC

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	var pistaEscenaCrimen : Pista = load("res://Pistas/EscenaCrimen.tres")
	var pistaAsesinoInterno : Pista = load("res://Pistas/AsesinatoInterno.tres")
	
	var dialogoElenaRecepcion : DialogueResource = load("res://Dialogos/primerEncuentroElena.dialogue")
	DialogueManager.show_dialogue_balloon(dialogoElenaRecepcion)
	await DialogueManager.dialogue_ended
	VariablesJugador.AgregarPista(pistaEscenaCrimen)
	VariablesJugador.AgregarPista(pistaAsesinoInterno)
	VariablesJugador.progresoActual = VariablesJugador.Progreso.LLEGAR_ESCENA_CRIMEN
