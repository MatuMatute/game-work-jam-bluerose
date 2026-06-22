class_name Juego extends Node

var mapaActual : Mapa

@onready var fondoInterfaz : FondoInterfaz = $FondoInterfaz
@onready var sonidoPisadas : AudioStreamPlayer = $Pisadas
@onready var sonidoPuerta : AudioStreamPlayer = $Puerta
@onready var musicaIntro : AudioStreamPlayer = $Inicio
@onready var musicaFondoInvestigacion : AudioStreamPlayer = $MusicaFondoInvestigacion
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
	cargarMapa(habitaciones[Mapa.IDsMapa.DESPACHO_DETECTIVE])
	musicaIntro.play()

func cambiarMapa(IDHabitacion : Mapa.IDsMapa) -> void:
	sonidoPuerta.play()
	fondoInterfaz.animacionesInterfaz.play("fundidoANegro")
	await fondoInterfaz.animacionesInterfaz.animation_finished
	if mapaActual != null: mapaActual.queue_free()
	cargarMapa(habitaciones[IDHabitacion])
	
	if (IDHabitacion == Mapa.IDsMapa.RESTAURANTE_COMEDOR_PUBLICO and musicaIntro.playing):
		apagarMusica(musicaIntro)

func cargarMapa(ubicacion : String) -> void:
	sonidoPisadas.play()
	var mapaCargado : PackedScene = load(ubicacion) as PackedScene
	var mapaInstanciado : Mapa = mapaCargado.instantiate()
	mapaActual = mapaInstanciado
	add_child(mapaInstanciado)
	fondoInterfaz.animacionesInterfaz.play("fundidoATransparente")

func acercarObjeto(objeto : PackedScene, objetoEscenario : ObjetoEscenario) -> void:
	var objetoAcercado : ObjetoZoom = objeto.instantiate()
	objetoAcercado.objetoBase = objetoEscenario
	add_child(objetoAcercado)

func apagarMusica(musica : AudioStreamPlayer) -> void:
	var animacionApagado : Tween = create_tween()
	animacionApagado.tween_property(musica, "volume_linear", 0.0, 1.0)
	await animacionApagado.finished
	musica.stop()

func regresarMusica(musica : AudioStreamPlayer) -> void:
	musica.play()
	var animacionEncendida : Tween = create_tween()
	animacionEncendida.tween_property(musica, "volume_linear", 1.0, 1.0).from(0.0)

func iniciarMusicaDeInvestigacion() -> void:
	musicaFondoInvestigacion.play()
