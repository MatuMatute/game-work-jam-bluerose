class_name LibroPistas extends TextureRect

@onready var animacionLibroPistas : AnimationPlayer = $animacionLibroPistas
@onready var primeraPagina : VBoxContainer = $PrimeraPagina
@onready var segundaPagina : VBoxContainer = $SegundaPagina

var escenaBotonPista : PackedScene = preload("uid://dxwnj33w64wae")
var pistas : Array[BotonPista]
var controlDeDeduccion : ControlDeDeduccion

func _ready() -> void:
	controlDeDeduccion = ControlDeDeduccion.new()
	controlDeDeduccion.PistaDeducida.connect(ActualizarPistas)
	ActualizarPistas()

func ActualizarPistas() -> void:
	if VariablesJugador.pistas.size() > 0:
		if pistas.size() > 0:
			for pista in pistas:
				pista.queue_free()
		
		for pista : Pista in VariablesJugador.pistas:
			var botonPista : BotonPista = escenaBotonPista.instantiate()
			botonPista.pista = pista
			botonPista.haSidoCliqueado.connect(controlDeDeduccion.RecibirPista)
			pistas.append(botonPista)
			if primeraPagina.size.y < 620.0:
				primeraPagina.add_child(botonPista)
			else:
				segundaPagina.add_child(botonPista)
