class_name DespachoLorenzo extends Mapa

func _ready() -> void:
	# Chequea el singleton a ver si el jugador esta en el prologo
	match VariablesJugador.progresoActual:
		VariablesJugador.Progreso.PROLOGO:
			pass
