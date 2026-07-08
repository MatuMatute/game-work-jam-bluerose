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
var pistas : Array[BotonPista]
var controlDeDeduccion : ControlDeDeduccion
var paginaActual : int = 1

func _ready() -> void:
	controlDeDeduccion = ControlDeDeduccion.new()
	controlDeDeduccion.PistaDeducida.connect(ActualizarPistas)
	ActualizarPistas()

func ActualizarPistas() -> void:
	if VariablesJugador.pistas.size() > 0:
		if pistas.size() > 0:
			for botonPista : BotonPista in pistas:
				botonPista.queue_free()
		
		pistas.clear()
		
		var cantidadDePistas : int = 0
		
		for pista : Pista in VariablesJugador.pistas:
			var botonPista : BotonPista = escenaBotonPista.instantiate()
			botonPista.pista = pista
			botonPista._ready()
			botonPista.haSidoCliqueado.connect(controlDeDeduccion.RecibirPista)
			pistas.append(botonPista)
			
			cantidadDePistas += 1
			
			if cantidadDePistas > pistasPorPaginaSegunTamaño[VariablesJugador.ConseguirIndiceFuente()]:
				segundaPagina.add_child(botonPista)
			else:
				primeraPagina.add_child(botonPista)
