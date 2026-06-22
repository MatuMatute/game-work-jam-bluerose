class_name Retrato extends NPC

#Entiendo que esto ya al estar con npc no deberia estar(??????? pero por si acaso xD
# A ver, como este objeto tendra un close up, mi recomendacion personal es la de hacerlo clase derivada de ObjetoEscenario
# Tambien porque podemos poner una variable estatica para que desaparezca el objetoEscenario una vez agarrado
func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	var retrato : Item = preload("res://Inventario/items/cuadroHombres.tres")
	
	var PistaHombresCuadro : Pista = load("res://Pistas/HombresCuadro.tres")
	
	var dialogoCuadros : DialogueResource = load("res://Dialogos/retratosDialogo.dialogue")
	DialogueManager.show_dialogue_balloon(dialogoCuadros)
	await DialogueManager.dialogue_ended
	VariablesJugador.AgregarPista(PistaHombresCuadro)
	Inventario.agregarObjeto(retrato)
	VariablesJugador.progresoActual = VariablesJugador.Progreso.LLEGADO_ESCENA_CRIMEN
