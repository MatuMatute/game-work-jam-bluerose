class_name EspejoEscenario extends ObjetoEscenario

enum EstadosDelEspejo {
	SIN_REVISAR = 0,
	GEMA_FALTANTE = 1,
	GEMA_COLOCADA = 2,
	PORTAL_DIMENSIONAL = 3
}

@onready var spriteEspejo : Sprite2D = $Espejo
@onready var spriteGemaFaltante : Sprite2D = $GemaFaltante

static var estado : EstadosDelEspejo;

func _ready() -> void:
	escenaZoom = load("uid://c8e4a6m27213i")
	super()
