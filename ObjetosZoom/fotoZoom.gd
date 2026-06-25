class_name FotoZoom extends ObjetoZoom

func _ready() -> void:
	var animacionAlAparecer : Tween = create_tween()
	animacionAlAparecer.set_parallel(true)
	animacionAlAparecer.tween_property(fondo, "position", CENTRO_PANTALLA - fondo.size / 2, DURACION_ANIMACION).from(posicionMouse - fondo.size / 2)
	animacionAlAparecer.tween_property(fondo, "scale", Vector2(0.5, 0.5), DURACION_ANIMACION).from(Vector2.ZERO)
	animacionAlAparecer.connect("finished", Comportamiento)

func Comportamiento() -> void:
	var LorenzoAlgoMas : Pista = load("res://Pistas/LorenzoAlgoMas.tres")
	VariablesJugador.AgregarPista(LorenzoAlgoMas)
	FotoEscenario.haSidoRevisado = true
	objetoBase.input_pickable = false

func Regresar(event : InputEvent) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	if !FotoEscenario.haSidoRevisado:
		return
	
	super.Comportamiento()
