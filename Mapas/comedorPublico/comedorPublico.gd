class_name ComedorPublico extends Mapa
# Por las dudas aclaro que esta clase es unicamente para el mapa del
# despacho del detective, hereda de la clase Mapa.

func _ready() -> void:
	# Chequea el singleton a ver si el jugador esta en el prologo
	match VariablesJugador.progresoActual:
		VariablesJugador.Progreso.PROLOGO:
			pass
