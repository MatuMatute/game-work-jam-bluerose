class_name Puerta
extends Area2D

@export var IDHabitacion : Mapa.IDsMapa

signal cambiarHabitacion(NumeroHabitacion : int)

func _ready() -> void:
	var nodoPrincipal : Juego = get_tree().current_scene as Juego
	connect("cambiarHabitacion", nodoPrincipal.cambiarMapa)

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	cambiarHabitacion.emit(IDHabitacion)
