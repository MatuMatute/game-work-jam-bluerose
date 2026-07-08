extends OptionButton

func _ready() -> void:
	selected = VariablesJugador.ConseguirIndiceFuente()
	item_selected.connect(VariablesJugador.AjustarIndiceFuente)
