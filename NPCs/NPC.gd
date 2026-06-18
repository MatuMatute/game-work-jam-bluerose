class_name NPC extends Area2D

const DIALOGO = preload("uid://biljmi5fgmoif")

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	DialogueManager.show_dialogue_balloon(DIALOGO)
