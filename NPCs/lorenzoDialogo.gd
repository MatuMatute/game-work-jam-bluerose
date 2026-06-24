class_name Lorenzo extends NPC

var llaveLorenzo : Item = preload("res://Inventario/items/llaveLorenzo.tres")

func _ready() -> void:
	if VariablesJugador.progresoActual >= VariablesJugador.Progreso.LLEGADO_ESCENA_CRIMEN:
		show()

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
		
	Inventario.agregarObjeto(llaveLorenzo)
	
	var dialogoLorenzoRecepcion : DialogueResource = load("res://Dialogos/LorenzoRecepcion.dialogue")
	DialogueManager.show_dialogue_balloon(dialogoLorenzoRecepcion)
	await DialogueManager.dialogue_ended
	VariablesJugador.progresoActual = VariablesJugador.Progreso.CONVERSACION_LORENZO
