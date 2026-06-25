class_name CajaEscenario extends ObjetoEscenario

enum EstadoDeLaCaja {
	CERRADO = 0,
	SIN_ABRIR = 1,
	ABIERTO = 2
}

static var estado : EstadoDeLaCaja;

func _ready() -> void:
	if estado == EstadoDeLaCaja.ABIERTO: input_pickable = false
	
	escenaZoom = load("uid://dhx7tmpxh81v0")
	super()
