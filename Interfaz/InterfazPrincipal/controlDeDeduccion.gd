class_name ControlDeDeduccion extends Node

signal PistaDeducida()
var pistas : Array[Pista]
var resultadoDeduccion : Pista

func _init() -> void:
	resultadoDeduccion = Pista.new()
	resultadoDeduccion.informacion = "Caca"

func RecibirPista(pistaRecibida : BotonPista) -> void:
	if not pistaRecibida.estaSeleccionado:
		pistas.erase(pistaRecibida.pista)
	else:
		pistas.append(pistaRecibida.pista)
	
	if pistas.size() == 3:
		var coincidencias : int = 0
		for pista : Pista in pistas:
			match pista.informacion:
				"PISTA1":
					coincidencias += 1
				"PISTA2":
					coincidencias += 1
				"PISTA3":
					coincidencias += 1
		
		if coincidencias == 3:
			VariablesJugador.RemoverTresPistas(pistas)
			VariablesJugador.AgregarPista(resultadoDeduccion)
			PistaDeducida.emit()
