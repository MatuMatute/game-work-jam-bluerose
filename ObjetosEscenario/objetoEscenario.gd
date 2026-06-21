class_name ObjetoEscenario extends Area2D

signal hacerZoomObjeto(escenaZoom : PackedScene, objetoEscenario : ObjetoEscenario)

var escenaZoom : PackedScene

func _ready() -> void:
	var nodoPrincipal : Juego = get_tree().current_scene as Juego
	connect("hacerZoomObjeto", nodoPrincipal.acercarObjeto)

func _input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	hacerZoomObjeto.emit(escenaZoom, self)
