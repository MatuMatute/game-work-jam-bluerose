class_name RestauranteRecepcion extends Mapa

@onready var location_card = $LocationCanvas/LocationCard

var pistaEscenaCrimen : Pista = load("res://Pistas/EscenaCrimen.tres")
var pistaAsesinoInterno : Pista = load("res://Pistas/AsesinatoInterno.tres")

var pistaQuienContrata : Pista = load("res://Pistas/QuienContrata.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if VariablesJugador.progresoActual == VariablesJugador.Progreso.CONVERSACION_ELENA:
		await location_card.mostrarCartel("Restaurante Familia Rossi - New York")
		var dialogoElenaRecepcion : DialogueResource = load("res://Dialogos/primerEncuentroElena.dialogue")
		DialogueManager.show_dialogue_balloon(dialogoElenaRecepcion)
		await DialogueManager.dialogue_ended
		VariablesJugador.AgregarPista(pistaEscenaCrimen)
		VariablesJugador.AgregarPista(pistaAsesinoInterno)
		VariablesJugador.RemoverPistas([pistaQuienContrata])
		VariablesJugador.progresoActual = VariablesJugador.Progreso.LLEGAR_ESCENA_CRIMEN
