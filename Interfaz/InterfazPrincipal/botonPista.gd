class_name BotonPista extends Button

signal haSidoCliqueado(pista : Pista)

var pista : Pista
var estaSeleccionado : bool

func _ready() -> void:
	text = pista.informacion
	estaSeleccionado = false

func Presionado() -> void:
	if not estaSeleccionado:
		add_theme_color_override("font_color", Color.RED)
		estaSeleccionado = true
	else:
		add_theme_color_override("font_color", Color.WHITE)
		estaSeleccionado = false
	
	haSidoCliqueado.emit(self)
