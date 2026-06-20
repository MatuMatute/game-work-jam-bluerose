extends Control

@onready var label = $Label 
#Nota para Dani (yo) que aún no aprende a usar todo: @onready declarar una variable y asignarle un valor automáticamente justo después de que el nodo y todos sus hijos hayan sido cargados y configurados en la escena

func mostrarCartel(texto: String):
	label.text = texto

	visible = true

	await get_tree().create_timer(3.0).timeout

	visible = false
