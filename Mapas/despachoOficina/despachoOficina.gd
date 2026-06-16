class_name DespachoOficina extends Mapa
# Por las dudas aclaro que esta clase es unicamente para el mapa del
# despacho del detective, hereda de la clase Mapa.

func _ready() -> void:
	# Chequea el singleton a ver si el jugador esta en el prologo
	match VariablesJugador.progresoActual:
		VariablesJugador.Progreso.PROLOGO:
			var dialogo : DialogueResource = load("res://Dialogos/ChiaraMichaelPrologo.dialogue")
			DialogueManager.show_dialogue_balloon(dialogo)
			await DialogueManager.dialogue_ended
			VariablesJugador.progresoActual = VariablesJugador.Progreso.CONVERSACION_ELENA
