class_name SliderVolumen extends HSlider

@export_enum("Master", "Musica", "Sonido") var nombreBus : String
var indiceBus : int

func _ready() -> void:
	indiceBus = AudioServer.get_bus_index(nombreBus)
	value_changed.connect(arrastradoTerminado)
	
	value = AudioServer.get_bus_volume_linear(indiceBus)

func arrastradoTerminado(valor : float) -> void:
	AudioServer.set_bus_volume_linear(indiceBus, valor)
