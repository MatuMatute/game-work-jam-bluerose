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
	
var PistaEspejo : Pista = load("res://Pistas/EspejoRaro.tres")
func Comportamiento() -> void:
	#dialogo base --> debe cambiar con los estados ¿condicional que evalue estado del espejo?
	var dialogoEspejoInicio : DialogueResource = load("res://Dialogos/dialogoEspejoDescubre.dialogue")
	DialogueManager.show_dialogue_balloon(dialogoEspejoInicio)
	await DialogueManager.dialogue_ended
	VariablesJugador.AgregarPista(PistaEspejo)
	
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
