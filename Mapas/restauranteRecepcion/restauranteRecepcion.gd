class_name RestauranteRecepcion extends Mapa

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if VariablesJugador.progresoActual == VariablesJugador.Progreso.CONVERSACION_ELENA:
		print("Dani, aca va el dialogo con Elena")
