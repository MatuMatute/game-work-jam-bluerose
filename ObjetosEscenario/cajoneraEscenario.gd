class_name CajoneraEscenario extends ObjetoEscenario

static var haSidoAgarrado : bool

func _ready() -> void:
	if haSidoAgarrado : queue_free()
	escenaZoom = load("uid://defrmkiwok6sg")
	super()
