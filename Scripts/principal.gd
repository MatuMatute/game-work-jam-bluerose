class_name Principal
extends Node

@export var areaActual : Node2D
@export var interfaz : Interfaz

var habitaciones : Array[PackedScene] = [
	preload("res://Escenas/primerNivel.tscn"),
	preload("res://Escenas/segundoNivel.tscn")
]

func cambiarArea(IDHabitacion : int) -> void:
	interfaz.animacionesInterfaz.play("fundidoANegro")
	await interfaz.animacionesInterfaz.animation_finished
	var area : Node2D = habitaciones[IDHabitacion].instantiate()
	areaActual.queue_free()
	areaActual = area
	add_child(area)
	interfaz.animacionesInterfaz.play("fundidoATrasparente")
