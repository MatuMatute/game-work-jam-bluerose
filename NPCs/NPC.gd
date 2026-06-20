class_name NPC extends Area2D

const DIALOGO = preload("uid://biljmi5fgmoif")

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	#LEEME, PUSE EL DIALOGO DE ELENA ACA PORQUE AUN NO AGREGUE NADA, PERO ESTA ACA Y NO TIENE QUE ESTARLO.... segundo, luego agrego que a la segunda vez que me hable, diga otra cosa, pero problema para la Dani del futuro
	var dialogoElenaRecepcion : DialogueResource = load("res://Dialogos/primerEncuentroElena.dialogue")
	DialogueManager.show_dialogue_balloon(dialogoElenaRecepcion)
