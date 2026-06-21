class_name FragmentoLlave1Escenario extends ObjetoEscenario

static var haSidoAgarrado : bool

func _ready() -> void:
	if haSidoAgarrado: queue_free()
	escenaZoom = load("uid://cfss7u40kggcw")
	super()
