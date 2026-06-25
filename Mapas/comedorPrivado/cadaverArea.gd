class_name CadaverArea extends NPC

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
	
	var PistaOtraDimensión : Pista = load("res://Pistas/OtraDimension.tres")
	var PistaPizzaEnvenenada : Pista = load("res://Pistas/PizzaEnvenenada.tres")
	var PistaQuienVictima : Pista = load("res://Pistas/QuienVictima.tres")
	
	var dialogoCadaver : DialogueResource = load("res://Dialogos/cadaverPrimerVistazo.dialogue")
	DialogueManager.show_dialogue_balloon(dialogoCadaver)
	await DialogueManager.dialogue_ended
	VariablesJugador.AgregarPista(PistaOtraDimensión)
	VariablesJugador.AgregarPista(PistaPizzaEnvenenada)
	VariablesJugador.RemoverPistas([PistaQuienVictima])
	haSidoRevisado = true
	queue_free()
