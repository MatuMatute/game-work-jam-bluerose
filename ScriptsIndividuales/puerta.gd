class_name Puerta extends Area2D

signal cambiarHabitacion(IDMapa : Mapa.IDsMapa, sonidoTransicion : SonidoTransicion)

enum SonidoTransicion {
	PUERTA = 0,
	ASCENSOR = 1,
	PORTAL = 2
}

@export var IDHabitacion : Mapa.IDsMapa
@export var Sonido : SonidoTransicion

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
	
	cambiarHabitacion.emit(IDHabitacion, Sonido)
