class_name ControlDeDeduccion extends Node

signal PistaDeducida()
var botonesPistas : Array[BotonPista]
var resultadoDeduccion : Pista = preload("uid://c1uvboj0imf0j")

func RecibirPista(pistaRecibida : BotonPista) -> void:
	if not pistaRecibida.estaSeleccionado:
		botonesPistas.erase(pistaRecibida)
	else:
		botonesPistas.append(pistaRecibida)
	
	if botonesPistas.size() == 3:
		var coincidencias : int = 0
		for botonPista : BotonPista in botonesPistas:
			match botonPista.pista.informacion:
				"Lorenzo, encargado del restaurante.":
					coincidencias += 1
				"Parece que Lorenzo se encuentra estresado.":
					coincidencias += 1
				"Lorenzo trabajaba como mercenario anteriormente.":
					coincidencias += 1
		
		if coincidencias == 3:
			var pistas : Array[Pista] = [botonesPistas[0].pista, botonesPistas[1].pista, botonesPistas[2].pista]
			VariablesJugador.RemoverTresPistas(pistas)
			VariablesJugador.AgregarPista(resultadoDeduccion)
			botonesPistas.clear()
			PistaDeducida.emit()
		else:
			for botonPista : BotonPista in botonesPistas:
				botonPista.DeseleccionarTrasDeduccionFallida()
			botonesPistas.clear()
