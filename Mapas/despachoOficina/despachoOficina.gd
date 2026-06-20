class_name DespachoOficina extends Mapa
# Por las dudas aclaro que esta clase es unicamente para el mapa del
# despacho del detective, hereda de la clase Mapa.

@onready var location_card = $LocationCard 

func _ready() -> void:
	# Chequea el singleton a ver si el jugador esta en el prologo --> necesito definitivamente mas comentarios jaja
	match VariablesJugador.progresoActual:
		VariablesJugador.Progreso.PROLOGO:
			await location_card.show_card("Año 1945 - New York")
			var dialogoPrologo : DialogueResource = load("res://Dialogos/ChiaraMichaelPrologo.dialogue")
			DialogueManager.show_dialogue_balloon(dialogoPrologo)
			await DialogueManager.dialogue_ended
			VariablesJugador.progresoActual = VariablesJugador.Progreso.CONVERSACION_ELENA
