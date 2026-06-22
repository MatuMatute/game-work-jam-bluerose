class_name ControlDeDeduccion extends Node

signal PistaDeducida()
var botonesPistas : Array[BotonPista]
var deducciones : Array[Deduccion] = [preload("uid://ek6eyxwl6u86"),preload("uid://hoha27x1wojn")]

func RecibirPista(pistaRecibida : BotonPista) -> void:
	if not pistaRecibida.estaSeleccionado:
		botonesPistas.erase(pistaRecibida)
	else:
		botonesPistas.append(pistaRecibida)
	
	if botonesPistas.size() == 3:
		var pistas : Array[Pista] = [botonesPistas[0].pista, botonesPistas[1].pista, botonesPistas[2].pista]
		var pistaDeducida : Pista
		
		for deduccion : Deduccion in deducciones:
			pistaDeducida = deduccion.RevisarDeduccion(pistas)
			if pistaDeducida != null: break
		
		if pistaDeducida != null:
			VariablesJugador.RemoverPistas(pistas)
			VariablesJugador.AgregarPista(pistaDeducida)
			botonesPistas.clear()
			PistaDeducida.emit()
		else:
			for botonPista : BotonPista in botonesPistas:
				botonPista.DeseleccionarTrasDeduccionFallida()
			botonesPistas.clear()
