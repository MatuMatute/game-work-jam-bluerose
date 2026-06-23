class_name Elena extends NPC

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	#por si las moscas quedan aqui
	var pistaEscenaCrimen : Pista = load("res://Pistas/EscenaCrimen.tres")
	var pistaAsesinoInterno : Pista = load("res://Pistas/AsesinatoInterno.tres")
	var pistaLorenzoEncargado : Pista = load("res://Pistas/LorenzoEncargado.tres")
	var pistaDamianoCocinero : Pista = load("res://Pistas/DamianoCocinero.tres")
	var pistaLucianoHermano : Pista = load("res://Pistas/LucianoHermano.tres")
	
	#(tocó comentarse TnT --> condicional que compara si el progreso actual está tras hablar con Chiara/prologo o si ya entré al comedor privado
	if VariablesJugador.progresoActual == VariablesJugador.Progreso.CONVERSACION_ELENA:
		var dialogoElenaRecepcion : DialogueResource = load("res://Dialogos/primerEncuentroElena.dialogue")
		DialogueManager.show_dialogue_balloon(dialogoElenaRecepcion)
		await DialogueManager.dialogue_ended
		VariablesJugador.AgregarPista(pistaEscenaCrimen)
		VariablesJugador.AgregarPista(pistaAsesinoInterno)
		VariablesJugador.progresoActual = VariablesJugador.Progreso.LLEGAR_ESCENA_CRIMEN
		
	elif VariablesJugador.progresoActual == VariablesJugador.Progreso.LLEGADO_ESCENA_CRIMEN:
		var dialogoElenaConLorenzo : DialogueResource = load("res://Dialogos/segundoEncuentroElena.dialogue")
		DialogueManager.show_dialogue_balloon(dialogoElenaConLorenzo)
		await DialogueManager.dialogue_ended
		VariablesJugador.AgregarPista(pistaLorenzoEncargado)
		VariablesJugador.AgregarPista(pistaDamianoCocinero)
		VariablesJugador.AgregarPista(pistaLucianoHermano)
		VariablesJugador.progresoActual = VariablesJugador.Progreso.CONVERSACION_LORENZO
