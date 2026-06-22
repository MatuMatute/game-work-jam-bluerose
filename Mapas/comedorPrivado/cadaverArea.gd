class_name CadaverArea extends NPC

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	var dialogoCadaver : DialogueResource = load("res://Dialogos/cadaverPrimerVistazo.dialogue")
	DialogueManager.show_dialogue_balloon(dialogoCadaver)
