class_name FragmentoLlave2Escenario extends ObjetoEscenario

static var haSidoAgarrado : bool

func _ready() -> void:
	if haSidoAgarrado: queue_free()
	escenaZoom = load("uid://chxl6va1tr03i")
	super()
