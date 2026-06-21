class_name LlaveEscenario extends ObjetoEscenario

static var haSidoAgarrado : bool

func _ready() -> void:
	if haSidoAgarrado: queue_free()
	escenaZoom = load("uid://c8e4a6m27213i")
	super()
