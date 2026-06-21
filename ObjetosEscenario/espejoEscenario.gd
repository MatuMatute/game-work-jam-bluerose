class_name EspejoEscenario extends ObjetoEscenario

enum EstadoDelEspejo {
	SIN_REVISAR = 0,
	GEMA_FALTANTE = 1,
	GEMA_COLOCADA = 2,
	PORTAL_DIMENSIONAL = 3
}

@onready var spriteEspejo : Sprite2D = $Espejo
@onready var spriteGemaFaltante : Sprite2D = $GemaFaltante

static var estado : EstadoDelEspejo;

func _ready() -> void:
	if estado == EstadoDelEspejo.SIN_REVISAR or estado == EstadoDelEspejo.GEMA_FALTANTE:
		spriteGemaFaltante.hide()
	
	escenaZoom = load("uid://b21xoluqhwahy")
	super()
