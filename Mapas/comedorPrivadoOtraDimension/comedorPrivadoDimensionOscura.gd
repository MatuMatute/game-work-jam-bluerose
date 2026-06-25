class_name ComedorPrivadoDimensionOscura extends Mapa

func _ready() -> void:
	# Chequea el singleton a ver si el jugador tiene que ir a la escena del crimen por primera vez
	if VariablesJugador.progresoActual == VariablesJugador.Progreso.DIMENSION_OSCURA:
		VariablesJugador.progresoActual = VariablesJugador.Progreso.LLEGADO_DIMENSION_OSCURA
		var dialogoDimensionOscura : DialogueResource = load("res://Dialogos/entradaDimensionOscura.dialogue")
		DialogueManager.show_dialogue_balloon(dialogoDimensionOscura)
