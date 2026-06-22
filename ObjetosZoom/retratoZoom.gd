class_name RetratoZoom extends ObjetoZoom

var retrato : Item = preload("res://Inventario/items/cuadroHombres.tres")

func _ready() -> void:
	posicionMouse = CENTRO_PANTALLA
	super()

func Comportamiento() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/cuchillo.dialogue"))
	await DialogueManager.dialogue_ended
	
	Inventario.agregarObjeto(retrato)
	CuchilloEscenario.haSidoAgarrado = true
	objetoBase.queue_free()
	super()
