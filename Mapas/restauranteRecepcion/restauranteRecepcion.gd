class_name RestauranteRecepcion extends Mapa

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if VariablesJuego.progresoActual == VariablesJuego.Progreso.CONVERSACION_ELENA:
		print("Dani, aca va el dialogo con Elena")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
