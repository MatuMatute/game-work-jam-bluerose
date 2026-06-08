class_name NPC
extends Area2D

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	print("Ahora deberia spawnear el cuadro de dialogo, esto podria requerir de comunicarse con la raiz de la escena.")
