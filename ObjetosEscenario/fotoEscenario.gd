class_name FotoEscenario extends ObjetoEscenario

static var haSidoRevisado : bool

func _ready() -> void:
	if haSidoRevisado : monitoring = false
	escenaZoom = load("uid://c8e4a6m27213i")
	super()
