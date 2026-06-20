class_name RestauranteRecepcion extends Mapa

@onready var location_card = $LocationCard

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if VariablesJugador.progresoActual == VariablesJugador.Progreso.CONVERSACION_ELENA:
		await location_card.show_card("Restaurante Familia Rossi - New York")
		
		print("Dani, aca va el dialogo con Elena")
