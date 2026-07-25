class_name FotoEscenario extends ObjetoEscenario

static var haSidoRevisado : bool

func _ready() -> void:
	if haSidoRevisado : input_pickable = false
	escenaZoom = load("uid://csnwr0biphujs")
	
	if OS.has_feature("web_android") or OS.has_feature("web_ios"):
		scale = Vector2(2.0, 2.0)
	
	super()
