class_name EspejoZoom extends ObjetoZoom

var texturaEspejoCompleto : Texture2D = preload("uid://ud2cdisnj28u")
var texturaEspejoDimension : Texture2D = preload("uid://ci8uqedxjurgp")

func _ready() -> void:
	match EspejoEscenario.estado:
		EspejoEscenario.EstadoDelEspejo.GEMA_COLOCADA:
			fondo.texture = texturaEspejoCompleto
		EspejoEscenario.EstadoDelEspejo.PORTAL_DIMENSIONAL:
			fondo.texture = texturaEspejoDimension
	super()

func Comportamiento() -> void:
	# Aca ira todo lo del espejo
	
	await DialogueManager.dialogue_ended
	# Dani, la funcion "super" ejecuta la funcion de la clase base, es como un metodo virtual y override en C#, cuando ejecutas la funcion usando "base."
	if EspejoEscenario.estado == EspejoEscenario.EstadoDelEspejo.SIN_REVISAR: 
		EspejoEscenario.estado = EspejoEscenario.EstadoDelEspejo.GEMA_FALTANTE
		super()

func Regresar(event : InputEvent) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	
	super.Comportamiento()
