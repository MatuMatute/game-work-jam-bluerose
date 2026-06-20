class_name RestauranteRecepcion extends Mapa

@onready var location_card = $LocationCard

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if VariablesJugador.progresoActual == VariablesJugador.Progreso.CONVERSACION_ELENA:
		await location_card.mostrarCartel("Restaurante Familia Rossi - New York")
		
		print("Ahora agrego a Elena y le pongo el dialogo, ya que ahora mismo esta en npc")
