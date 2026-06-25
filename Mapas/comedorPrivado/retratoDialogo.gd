class_name Retrato extends ObjetoEscenario

var dialogoCuadros : DialogueResource = preload("res://Dialogos/retratoDialogo1.dialogue")

static var haSidoAgarrado : bool

func _ready() -> void:
	if haSidoAgarrado : queue_free()
	escenaZoom = load("uid://d0wiwtioccjd3")
	super()

func _input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	input_pickable = false
	DialogueManager.show_dialogue_balloon(dialogoCuadros)
	await DialogueManager.dialogue_ended
	hacerZoomObjeto.emit(escenaZoom, self)
