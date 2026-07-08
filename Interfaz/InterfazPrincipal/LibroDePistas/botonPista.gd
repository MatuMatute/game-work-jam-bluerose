class_name BotonPista extends Button

signal haSidoCliqueado(pista : Pista)

var pista : Pista
var estaSeleccionado : bool

func _ready() -> void:
	add_theme_font_size_override("font_size", VariablesJugador.ConseguirTamañoFuente())
	text = pista.informacion
	estaSeleccionado = false

func Presionado() -> void:
	if not estaSeleccionado:
		add_theme_color_override("font_color", Color.RED)
		estaSeleccionado = true
	else:
		add_theme_color_override("font_color", Color.BLACK)
		estaSeleccionado = false
	
	haSidoCliqueado.emit(self)

func SeleccionarMientrasSeDeduce() -> void:
	add_theme_color_override("font_color", Color.RED)
	estaSeleccionado = true

func DeseleccionarTrasDeduccionFallida() -> void:
	add_theme_color_override("font_color", Color.BLACK)
	estaSeleccionado = false
