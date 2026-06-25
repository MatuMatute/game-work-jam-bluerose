class_name FotoEscenario extends ObjetoEscenario

static var haSidoRevisado : bool

func _ready() -> void:
	if haSidoRevisado : input_pickable = false
	escenaZoom = load("uid://csnwr0biphujs")
	super()
