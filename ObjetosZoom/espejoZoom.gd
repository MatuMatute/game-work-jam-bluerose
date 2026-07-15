class_name EspejoZoom extends ObjetoZoom

signal transladarDimensiones(dimensionOscura : bool)

var dialogoMichaelPortal : DialogueResource = load("res://Dialogos/michaelPortal.dialogue")

var texturaEspejoCompleto : Texture2D = preload("uid://ud2cdisnj28u")
var texturaEspejoDimension : Texture2D = preload("uid://ci8uqedxjurgp")

var gemaNecesaria : Item = load("res://Inventario/items/gemaTallada.tres")
var PistaEspejo : Pista = load("res://Pistas/EspejoRaro.tres")

@onready var timerActivacionPortal : Timer = $ActivacionPortal

func _ready() -> void:
	var nodoPrincipal : Juego = get_tree().current_scene as Juego
	connect("transladarDimensiones", nodoPrincipal.cambiarDimension)
	
	match EspejoEscenario.estado:
		EspejoEscenario.EstadoDelEspejo.GEMA_COLOCADA:
			fondo.texture = texturaEspejoCompleto
		EspejoEscenario.EstadoDelEspejo.PORTAL_DIMENSIONAL:
			fondo.texture = texturaEspejoDimension
	super()

func Comportamiento() -> void:
	# Si, dani
	if EspejoEscenario.estado == EspejoEscenario.EstadoDelEspejo.SIN_REVISAR: 
		var dialogoEspejoInicio : DialogueResource = load("res://Dialogos/dialogoEspejoDescubre.dialogue")
		DialogueManager.show_dialogue_balloon(dialogoEspejoInicio)
		await DialogueManager.dialogue_ended
		VariablesJugador.AgregarPista(PistaEspejo)
		
		EspejoEscenario.estado = EspejoEscenario.EstadoDelEspejo.GEMA_FALTANTE
		super()
	
	if EspejoEscenario.estado == EspejoEscenario.EstadoDelEspejo.PORTAL_DIMENSIONAL:
		transladarDimensiones.emit(false)
		super.Comportamiento()

func Regresar(event : InputEvent) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	if EspejoEscenario.estado != EspejoEscenario.EstadoDelEspejo.GEMA_FALTANTE:
		return
	
	super.Comportamiento()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if !event.button_index == MOUSE_BUTTON_LEFT:
			return
		if !event.is_released():
			return
		if VariablesJugador.slotAgarrado == null:
			return
		if EspejoEscenario.estado != EspejoEscenario.EstadoDelEspejo.GEMA_FALTANTE:
			return
		
		if fondo.get_global_rect().has_point(event.global_position):
			if VariablesJugador.slotAgarrado.itemBase == gemaNecesaria:
				EspejoEscenario.estado = EspejoEscenario.EstadoDelEspejo.GEMA_COLOCADA
				(objetoBase as EspejoEscenario).spriteGemaFaltante.show()
				fondo.texture = texturaEspejoCompleto
				timerActivacionPortal.start()
				VariablesJugador.slotAgarrado.queue_free()
				Inventario.quitarObjeto(gemaNecesaria)

func ActivarPortal() -> void:
	EspejoEscenario.estado = EspejoEscenario.EstadoDelEspejo.PORTAL_DIMENSIONAL
	VariablesJugador.RemoverPistas([PistaEspejo])
	fondo.texture = texturaEspejoDimension
	DialogueManager.show_dialogue_balloon(dialogoMichaelPortal)
	await DialogueManager.dialogue_ended
	transladarDimensiones.emit(true)
	super.Comportamiento()
