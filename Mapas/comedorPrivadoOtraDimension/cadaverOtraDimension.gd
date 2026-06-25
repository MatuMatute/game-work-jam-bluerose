class_name CadaverOtraDimension extends NPC

static var haSidoRevisado : bool

func _ready() -> void:
	if haSidoRevisado: queue_free()

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	var dialogoCadaver : DialogueResource = load("res://Dialogos/cadaverVistazoDimensionOsc.dialogue")
	DialogueManager.show_dialogue_balloon(dialogoCadaver)
	await DialogueManager.dialogue_ended
	haSidoRevisado = true
	queue_free()
