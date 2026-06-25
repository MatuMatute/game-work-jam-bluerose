class_name LlaveLorenzoZoom extends ObjetoZoom

var llaveLorenzo : Item = preload("res://Inventario/items/llaveLorenzo.tres")

func _ready() -> void:
	posicionMouse = Vector2(200, 512)
	super()

func Comportamiento() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/LorenzoRecepcion2.dialogue"))
	await DialogueManager.dialogue_ended
	Inventario.agregarObjeto(llaveLorenzo)
	VariablesJugador.progresoActual = VariablesJugador.Progreso.OFICINA_LORENZO
	super()
