class_name ControlDeDeduccion extends Node

signal PistaDeducida()
var botonesPistas : Array[BotonPista]
var pistas : Array[Pista]
var deducciones : Array[Deduccion] = [preload("uid://ek6eyxwl6u86"),preload("uid://hoha27x1wojn")]

func RecibirPista(pistaRecibida : BotonPista) -> void:
	if not pistaRecibida.estaSeleccionado:
		botonesPistas.erase(pistaRecibida)
		pistas.erase(pistaRecibida.pista)
	else:
		botonesPistas.append(pistaRecibida)
		pistas.append(pistaRecibida.pista)
	
	if pistas.size() == 3:
		var pistaDeducida : Pista
		
		for deduccion : Deduccion in deducciones:
			pistaDeducida = deduccion.RevisarDeduccion(pistas)
			if pistaDeducida != null: break
		
		if pistaDeducida != null:
			VariablesJugador.RemoverPistas(pistas)
			VariablesJugador.AgregarPista(pistaDeducida)
			pistas.clear()
			botonesPistas.clear()
			PistaDeducida.emit()
		else:
			for botonPista : BotonPista in botonesPistas:
				if botonPista != null:
					botonPista.DeseleccionarTrasDeduccionFallida()
			pistas.clear()
			botonesPistas.clear()

func ActualizarBotonesPistas(botonPista : BotonPista) -> void:
	var indicePista : int = pistas.find(botonPista.pista)
	
	if indicePista == -1: return
	
	botonesPistas[indicePista] = botonPista
	botonPista.SeleccionarMientrasSeDeduce()
