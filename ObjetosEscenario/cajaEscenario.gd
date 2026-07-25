class_name CajaEscenario extends ObjetoEscenario

enum EstadoDeLaCaja {
	CERRADO = 0,
	SIN_ABRIR = 1,
	ABIERTO = 2
}

static var estado : EstadoDeLaCaja;

@export var colision : CollisionShape2D

func _ready() -> void:
	if estado == EstadoDeLaCaja.ABIERTO: input_pickable = false
	escenaZoom = load("uid://dhx7tmpxh81v0")
	
	if OS.has_feature("web_android") or OS.has_feature("web_ios"):
		colision.scale = Vector2(1.5, 1.5)
	
	super()
