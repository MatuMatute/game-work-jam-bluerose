class_name LibroPistas extends TextureRect

const pistasPorPaginaSegunTamaño : Array[int] = [
	8,
	6,
	4
]

@onready var animacionLibroPistas : AnimationPlayer = $animacionLibroPistas
@onready var primeraPagina : VBoxContainer = $PrimeraPagina
@onready var segundaPagina : VBoxContainer = $SegundaPagina

var escenaBotonPista : PackedScene = preload("uid://dxwnj33w64wae")
var escenaCambiarPagina : PackedScene = preload("uid://ti03oxk7u0vw")
var pistas : Array[BotonPista]
var controlDeDeduccion : ControlDeDeduccion
var paginaActual : int = 0
var avanzarPagina : TextureButton
var regresarPagina : TextureButton

func _ready() -> void:
	controlDeDeduccion = ControlDeDeduccion.new()
	controlDeDeduccion.PistaDeducida.connect(ActualizarPistas)
	ActualizarPistas()

func ActualizarPistas() -> void:
	if avanzarPagina != null : avanzarPagina.queue_free()
	if regresarPagina != null : regresarPagina.queue_free()
	
	if VariablesJugador.pistas.size() > 0:
		if pistas.size() > 0:
			for botonPista : BotonPista in pistas:
				botonPista.queue_free()
		
		pistas.clear()
		
		avanzarPagina = escenaCambiarPagina.instantiate()
		avanzarPagina.set_position(Vector2(1320.0, 200.0))
		avanzarPagina.pressed.connect(AvanzarPagina)
		add_child(avanzarPagina)
		
		if paginaActual > 0:
			regresarPagina = escenaCambiarPagina.instantiate()
			regresarPagina.set_position(Vector2(-72.0, 200.0))
			regresarPagina.flip_h = true
			regresarPagina.pressed.connect(RegresarPagina)
			add_child(regresarPagina)
		
		for indice : int in range(pistasPorPaginaSegunTamaño[VariablesJugador.ConseguirIndiceFuente()] * paginaActual, pistasPorPaginaSegunTamaño[VariablesJugador.ConseguirIndiceFuente()] * (paginaActual + 2)):
			if indice == VariablesJugador.pistas.size():
				avanzarPagina.queue_free()
				break
			
			var botonPista : BotonPista = escenaBotonPista.instantiate()
			botonPista.pista = VariablesJugador.pistas[indice]
			botonPista._ready()
			botonPista.haSidoCliqueado.connect(controlDeDeduccion.RecibirPista)
			controlDeDeduccion.ActualizarBotonesPistas(botonPista)
			pistas.append(botonPista)
			
			if indice >= pistasPorPaginaSegunTamaño[VariablesJugador.ConseguirIndiceFuente()] * (paginaActual + 1):
				segundaPagina.add_child(botonPista)
			else:
				primeraPagina.add_child(botonPista)

func AvanzarPagina() -> void:
	paginaActual += 2
	ActualizarPistas()

func RegresarPagina() -> void:
	paginaActual -= 2
	ActualizarPistas()
