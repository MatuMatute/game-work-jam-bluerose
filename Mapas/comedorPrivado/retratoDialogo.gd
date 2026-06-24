class_name Retrato extends ObjetoEscenario

static var haSidoAgarrado : bool

func _ready() -> void:
	if haSidoAgarrado : queue_free()
	escenaZoom = load("uid://d0wiwtioccjd3")
	super()

#Entiendo que esto ya al estar con npc no deberia estar(??????? pero por si acaso xD
# A ver, como este objeto tendra un close up, mi recomendacion personal es la de hacerlo clase derivada de ObjetoEscenario
# Tambien porque podemos poner una variable estatica para que desaparezca el objetoEscenario una vez agarrado
func _input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	var dialogoCuadros : DialogueResource = load("res://Dialogos/retratoDialogo1.dialogue")
	DialogueManager.show_dialogue_balloon(dialogoCuadros)
	await DialogueManager.dialogue_ended
	
	hacerZoomObjeto.emit(escenaZoom, self)
