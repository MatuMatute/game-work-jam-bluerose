extends Button

signal cambiarAMenuDeOpciones(escena : PackedScene)

var escenaMenuOpciones : PackedScene = preload("res://Interfaz/MenuPrincipal/menuOpciones.tscn")

func _pressed() -> void:
	cambiarAMenuDeOpciones.emit(escenaMenuOpciones)
