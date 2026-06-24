class_name FotoZoom extends ObjetoZoom

func _ready() -> void:
	posicionMouse = CENTRO_PANTALLA
	
	var animacionAlAparecer : Tween = create_tween()
	animacionAlAparecer.set_parallel(true)
	animacionAlAparecer.tween_property(fondo, "position", CENTRO_PANTALLA - fondo.size / 2, DURACION_ANIMACION).from(posicionMouse - fondo.size / 2)
	animacionAlAparecer.tween_property(fondo, "scale", Vector2(0.5, 0.5), DURACION_ANIMACION).from(Vector2.ZERO)
	animacionAlAparecer.connect("finished", Comportamiento)

func Comportamiento() -> void:
	var LorenzoAlgoMas : Pista = load("res://Pistas/LorenzoAlgoMas.tres")
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/retratoDialogo2.dialogue"))
	await DialogueManager.dialogue_ended
	
	FotoEscenario.haSidoRevisado = true
	VariablesJugador.AgregarPista(LorenzoAlgoMas)
	super()
