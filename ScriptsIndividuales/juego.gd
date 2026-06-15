class_name Juego extends Node

var mapaActual : Mapa

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
	var mapaInstanciado : Mapa = mapaCargado.instantiate()
	mapaActual = mapaInstanciado
	print(mapaActual)
	add_child(mapaInstanciado)
	fondoInterfaz.animacionesInterfaz.play("fundidoATransparente")

func oscurecerFondo() -> void:
	fondoInterfaz.animacionesInterfaz.play("fundidoAOscuro")

func aclararFondo() -> void:
	fondoInterfaz.animacionesInterfaz.play_backwards("fundidoAOscuro")
