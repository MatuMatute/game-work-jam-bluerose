class_name RetratoZoom extends ObjetoZoom

var retrato : Item = preload("res://Inventario/items/cuadroHombres.tres")
var PistaHombresCuadro : Pista = preload("res://Pistas/HombresCuadro.tres")

func _ready() -> void:
	posicionMouse = Vector2(600.0, 96.0)
	
	var animacionAlAparecer : Tween = create_tween()
	animacionAlAparecer.set_parallel(true)
	animacionAlAparecer.tween_property(fondo, "position", CENTRO_PANTALLA - fondo.size / 2, DURACION_ANIMACION).from(posicionMouse - fondo.size / 2)
	animacionAlAparecer.tween_property(fondo, "scale", Vector2(0.5, 0.5), DURACION_ANIMACION).from(Vector2.ZERO)
	animacionAlAparecer.connect("finished", Comportamiento)

func Comportamiento() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/retratoDialogo2.dialogue"))
	await DialogueManager.dialogue_ended
	
	Inventario.agregarObjetoYActualizar(retrato)
	Retrato.haSidoAgarrado = true
	VariablesJugador.AgregarPista(PistaHombresCuadro)
	VariablesJugador.progresoActual = VariablesJugador.Progreso.LLEGADO_ESCENA_CRIMEN
	objetoBase.queue_free()
	super()
