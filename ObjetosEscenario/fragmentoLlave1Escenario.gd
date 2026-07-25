class_name FragmentoLlave1Escenario extends ObjetoEscenario

static var haSidoAgarrado : bool

func _ready() -> void:
	if haSidoAgarrado: queue_free()
	escenaZoom = load("uid://cfss7u40kggcw")
	
	if OS.has_feature("web_android") or OS.has_feature("web_ios"):
		scale = Vector2(2.0, 2.0)
	
	super()
