class_name Elena extends NPC

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	#por si las moscas quedan aqui
	var pistaLorenzoEncargado : Pista = load("res://Pistas/LorenzoEncargado.tres")
	var pistaDamianoCocinero : Pista = load("res://Pistas/DamianoCocinero.tres")
	var pistaLucianoHermano : Pista = load("res://Pistas/LucianoHermano.tres")
	var pistaLorenzoMercenario : Pista = load("res://Pistas/LorenzoMercenario.tres")
	
	var pistaHombresCuadro : Pista = load("res://Pistas/HombresCuadro.tres")
	var pistaLorenzoAlgoMas : Pista = load("res://Pistas/LorenzoAlgoMas.tres")
	
	if VariablesJugador.TienePista(pistaHombresCuadro) and VariablesJugador.progresoActual == VariablesJugador.Progreso.LLEGADO_ESCENA_CRIMEN:
		var dialogoElenaConLorenzo : DialogueResource = load("res://Dialogos/segundoEncuentroElena.dialogue")
		DialogueManager.show_dialogue_balloon(dialogoElenaConLorenzo)
		await DialogueManager.dialogue_ended
		VariablesJugador.AgregarPista(pistaLorenzoEncargado)
		VariablesJugador.AgregarPista(pistaDamianoCocinero)
		VariablesJugador.AgregarPista(pistaLucianoHermano)
		VariablesJugador.RemoverPistas([pistaHombresCuadro])
		VariablesJugador.progresoActual = VariablesJugador.Progreso.CONVERSACION_LORENZO
	
	elif VariablesJugador.TienePista(pistaLorenzoAlgoMas) and VariablesJugador.progresoActual == VariablesJugador.Progreso.LLEGADO_OFICINA_LORENZO:
		VariablesJugador.progresoActual = VariablesJugador.Progreso.DIMENSION_OSCURA
		var dialogoElenaSobreLorenzo : DialogueResource = load("res://Dialogos/tercerEncuentroElena.dialogue")
		DialogueManager.show_dialogue_balloon(dialogoElenaSobreLorenzo)
		await DialogueManager.dialogue_ended
		VariablesJugador.AgregarPista(pistaLorenzoMercenario)
		VariablesJugador.RemoverPistas([pistaLorenzoAlgoMas])
		
		if Inventario.tieneObjeto(load("res://Inventario/items/reloj.tres")):
			DialogueManager.show_dialogue_balloon(load("res://Dialogos/SombraHabla.dialogue"))
