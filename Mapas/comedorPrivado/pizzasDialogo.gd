class_name Pizzas extends NPC

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if EspejoEscenario.estado == EspejoEscenario.EstadoDelEspejo.GEMA_COLOCADA:
		return
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	var dialogoPizzas : DialogueResource = load("res://Dialogos/pizzas.dialogue")
	DialogueManager.show_dialogue_balloon(dialogoPizzas)
