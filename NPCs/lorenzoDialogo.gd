class_name Lorenzo extends NPC

var llaveLorenzoZoom : PackedScene = preload("res://ObjetosZoom/llaveLorenzoZoom.tscn")

func _ready() -> void:
	if Retrato.haSidoAgarrado:
		show()

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	input_pickable = false
	
	if VariablesJugador.progresoActual == VariablesJugador.Progreso.CONVERSACION_LORENZO:
		var dialogoLorenzoRecepcion : DialogueResource = load("res://Dialogos/LorenzoRecepcion1.dialogue")
		DialogueManager.show_dialogue_balloon(dialogoLorenzoRecepcion)
		await DialogueManager.dialogue_ended
		var nodoPrincipal : Juego = get_tree().current_scene as Juego
		nodoPrincipal.acercarObjeto(llaveLorenzoZoom, null)
	
	input_pickable = true
