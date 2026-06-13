class_name Juego
extends Node

var mapaActual : Node2D

@onready var fondoInterfaz : FondoInterfaz = $FondoInterfaz
@onready var mensajeErrorCargarArea : PackedScene = preload("res://Escenas/mensajeErrorCargarArea.tscn")

var habitaciones : Array[String] = [
	"res://Mapas/despachoOficina/despachoOficina.tscn",
	"res://Mapas/restauranteRecepcion/restauranteRecepcion.tscn"
]

func _ready() -> void:
	cargarMapa(habitaciones[0])

func cambiarMapa(IDHabitacion : int) -> void:
	fondoInterfaz.animacionesInterfaz.play("fundidoANegro")
	await fondoInterfaz.animacionesInterfaz.animation_finished
	if mapaActual != null: mapaActual.queue_free()
	cargarMapa(habitaciones[IDHabitacion])

func cargarMapa(ubicacion : String) -> void:
	var mapaCargado : PackedScene = load(ubicacion) as PackedScene
	add_child(mapaCargado.instantiate())
	fondoInterfaz.animacionesInterfaz.play("fundidoATransparente")
