class_name Puerta
extends Area2D
@export var IDHabitacion : int

signal cambiarHabitacion(NumeroHabitacion : int)

func _ready() -> void:
	var nodoPrincipal : Principal = get_tree().current_scene as Principal
	connect("cambiarHabitacion", nodoPrincipal.cambiarArea)

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	emit_signal("cambiarHabitacion", IDHabitacion)
