class_name PuertaCerrada extends Puerta

@export var dialogoCerrado : DialogueResource
@export var llave : Item

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	if Inventario.tieneObjeto(llave):
		cambiarHabitacion.emit(IDHabitacion, Sonido)
	else:
		DialogueManager.show_dialogue_balloon(dialogoCerrado)
