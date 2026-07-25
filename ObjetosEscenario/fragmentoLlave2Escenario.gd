class_name FragmentoLlave2Escenario extends ObjetoEscenario

static var haSidoAgarrado : bool

func _ready() -> void:
	if haSidoAgarrado: queue_free()
	escenaZoom = load("uid://chxl6va1tr03i")
	
	if OS.has_feature("web_android") or OS.has_feature("web_ios"):
		scale = Vector2(2.0, 2.0)
	
	super()
