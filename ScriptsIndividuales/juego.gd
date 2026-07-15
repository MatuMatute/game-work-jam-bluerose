class_name Juego extends Node

var mapaActual : Mapa
var escenaFinalDemo : PackedScene = preload("res://Escenas/finalDemo.tscn")
var escenaFondoInterfaz : PackedScene = preload("res://Interfaz/Fondo/fondoInterfaz.tscn")
var escenaInterfazPrincipal : PackedScene = preload("res://Interfaz/InterfazPrincipal/interfazPrincipal.tscn")
var escenaMenuPausa : PackedScene = preload("res://Interfaz/MenuPausa/menuPausa.tscn")

@onready var sonidoPisadas : AudioStreamPlayer = $Pisadas
@onready var sonidoPuerta : AudioStreamPlayer = $Puerta
@onready var sonidoAscensor : AudioStreamPlayer = $Ascensor
@onready var sonidoPortal : AudioStreamPlayer = $Portal
@onready var musicaIntro : AudioStreamPlayer = $Inicio
@onready var musicaFondoInvestigacion : AudioStreamPlayer = $MusicaFondoInvestigacion
@onready var musicaDimensionOscura : AudioStreamPlayer = $DimensionOscura

var fondoInterfaz : FondoInterfaz

var habitaciones : Array[String] = [
	"res://Mapas/despachoOficina/despachoOficina.tscn",
	"res://Mapas/restauranteRecepcion/restauranteRecepcion.tscn",
	"res://Mapas/comedorPublico/comedorPublico.tscn",
	"res://Mapas/comedorPrivado/comedorPrivado.tscn",
	"res://Mapas/comedorPrivadoOtraDimension/comedorPrivadoDimensionOscura.tscn",
	"Pasillo",
	"res://Mapas/despachoLorenzo/despachoLorenzo.tscn"
]

func _ready() -> void:
	get_tree().paused = true

func empezarPartida(menuPrincipal : MenuPrincipal) -> void:
	var interfazPrincipal : InterfazPrincipal = escenaInterfazPrincipal.instantiate()
	fondoInterfaz = escenaFondoInterfaz.instantiate()
	add_child(fondoInterfaz)
	add_child(interfazPrincipal)
	cargarMapa(habitaciones[Mapa.IDsMapa.DESPACHO_DETECTIVE])
	musicaIntro.play()
	menuPrincipal.queue_free()
	get_tree().paused = false

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("PausarJuego") and !get_tree().paused):
		get_tree().paused = true
		var menuPausa : MenuPausa = escenaMenuPausa.instantiate()
		add_child(menuPausa)

func cambiarMapa(IDHabitacion : Mapa.IDsMapa, Sonido : Puerta.SonidoTransicion) -> void:
	# Sonido que se reproducira al transicionar
	match Sonido:
		Puerta.SonidoTransicion.PUERTA: sonidoPuerta.play()
		Puerta.SonidoTransicion.ASCENSOR: sonidoAscensor.play()
	
	fondoInterfaz.animacionesInterfaz.play("fundidoANegro")
	await fondoInterfaz.animacionesInterfaz.animation_finished
	if mapaActual != null: mapaActual.queue_free()
	cargarMapa(habitaciones[IDHabitacion])
	
	if (IDHabitacion == Mapa.IDsMapa.RESTAURANTE_COMEDOR_PUBLICO and musicaIntro.playing):
		apagarMusicaEspecifica(musicaIntro)

func cargarMapa(ubicacion : String) -> void:
	sonidoPisadas.play()
	var mapaCargado : PackedScene = load(ubicacion) as PackedScene
	var mapaInstanciado : Mapa = mapaCargado.instantiate()
	mapaActual = mapaInstanciado
	add_child(mapaInstanciado)
	fondoInterfaz.animacionesInterfaz.play("fundidoATransparente")

func cambiarDimension(dimensionOscura : bool) -> void:
	sonidoPortal.play()
	fondoInterfaz.animacionesInterfaz.play("fundidoANegro")
	await fondoInterfaz.animacionesInterfaz.animation_finished
	if mapaActual != null: mapaActual.queue_free()
	
	if dimensionOscura:
		cargarMapa(habitaciones[Mapa.IDsMapa.RESTAURANTE_DIMENSION_PARALELA])
		apagarMusicaEspecifica(musicaFondoInvestigacion)
		musicaDimensionOscura.play()
	else:
		cargarMapa(habitaciones[Mapa.IDsMapa.RESTAURANTE_COMEDOR_PRIVADO])
		apagarMusicaEspecifica(musicaDimensionOscura)
		regresarMusica(musicaFondoInvestigacion)

func acercarObjeto(objeto : PackedScene, objetoEscenario : ObjetoEscenario) -> void:
	var objetoAcercado : ObjetoZoom = objeto.instantiate()
	objetoAcercado.objetoBase = objetoEscenario
	add_child(objetoAcercado)

func apagarMusicaEspecifica(musica : AudioStreamPlayer) -> void:
	var animacionApagado : Tween = create_tween()
	animacionApagado.tween_property(musica, "volume_linear", 0.0, 1.0)
	await animacionApagado.finished
	musica.stop()

func regresarMusica(musica : AudioStreamPlayer) -> void:
	musica.play()
	var animacionEncendida : Tween = create_tween()
	animacionEncendida.tween_property(musica, "volume_db", -10.0, 1.0).from(-80.0)

func iniciarMusicaDeInvestigacion() -> void:
	musicaFondoInvestigacion.play()

func terminarDemo() -> void:
	var finalDemo : Node = escenaFinalDemo.instantiate()
	add_child(finalDemo)
