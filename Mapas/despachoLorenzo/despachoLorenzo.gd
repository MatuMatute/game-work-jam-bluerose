class_name DespachoLorenzo extends Mapa

func _ready() -> void:
	# Chequea el singleton a ver si el jugador llega por primera vez aca
	if VariablesJugador.progresoActual == VariablesJugador.Progreso.OFICINA_LORENZO:
		DialogueManager.show_dialogue_balloon(load("res://Dialogos/llegadaDespachoLorenzo.dialogue"))
		VariablesJugador.progresoActual = VariablesJugador.Progreso.LLEGADO_OFICINA_LORENZO
