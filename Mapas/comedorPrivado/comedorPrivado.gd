class_name ComedorPrivado extends Mapa

signal comienzaInvestigacion()

func _ready() -> void:
	# Chequea el singleton a ver si el jugador tiene que ir a la escena del crimen por primera vez
	if VariablesJugador.progresoActual == VariablesJugador.Progreso.LLEGAR_ESCENA_CRIMEN:
		var nodoPrincipal : Juego = get_tree().current_scene as Juego
		connect("comienzaInvestigacion", nodoPrincipal.iniciarMusicaDeInvestigacion, 4)
		comienzaInvestigacion.emit()
		VariablesJugador.progresoActual = VariablesJugador.Progreso.LLEGADO_ESCENA_CRIMEN
		# Dani aca va el primer dialogo de Michael cuando llega a la escena del crimen
