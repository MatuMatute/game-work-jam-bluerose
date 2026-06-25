class_name PanueloLMEscenario extends ObjetoEscenario

static var haSidoAgarrado : bool

func _ready() -> void:
	if haSidoAgarrado : queue_free()
	escenaZoom = load("uid://b3n6av2xusdcd")
	super()
