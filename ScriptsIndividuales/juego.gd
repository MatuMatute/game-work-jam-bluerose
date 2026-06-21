class_name Juego extends Node

var mapaActual : Mapa

@onready var fondoInterfaz : FondoInterfaz = $FondoInterfaz
@onready var sonidoPisadas : AudioStreamPlayer = $Pisadas
@onready var sonidoPuerta : AudioStreamPlayer = $Puerta
@onready var mensajeErrorCargarArea : PackedScene = preload("res://Escenas/mensajeErrorCargarArea.tscn")

var habitaciones : Array[String] = [
	"res://Mapas/despachoOficina/despachoOficina.tscn",
	"res://Mapas/restauranteRecepcion/restauranteRecepcion.tscn",
	"res://Mapas/comedorPublico/comedorPublico.tscn",
	"res://Mapas/comedorPrivado/comedorPrivado.tscn",
	"DimensionParalela",
	"Pasillo",
	"res://Mapas/despachoLorenzo/despachoLorenzo.tscn"
]

func _ready() -> void:
	cargarMapa(habitaciones[0])

func cambiarMapa(IDHabitacion : int) -> void:
	sonidoPuerta.play()
	fondoInterfaz.animacionesInterfaz.play("fundidoANegro")
	await fondoInterfaz.animacionesInterfaz.animation_finished
	if mapaActual != null: mapaActual.queue_free()
	cargarMapa(habitaciones[IDHabitacion])

func cargarMapa(ubicacion : String) -> void:
	sonidoPisadas.play()
	var mapaCargado : PackedScene = load(ubicacion) as PackedScene
	var mapaInstanciado : Mapa = mapaCargado.instantiate()
	mapaActual = mapaInstanciado
	print(mapaActual)
	add_child(mapaInstanciado)
	fondoInterfaz.animacionesInterfaz.play("fundidoATransparente")

func acercarObjeto(objeto : PackedScene) -> void:
	var objetoAcercado : ObjetoZoom = objeto.instantiate()
	add_child(objetoAcercado)
