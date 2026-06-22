class_name CuchilloZoom extends ObjetoZoom

var cuchillo : Item = preload("res://Inventario/items/cuchillo.tres")

func Comportamiento() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/cuchillo.dialogue"))
	await DialogueManager.dialogue_ended
	
	Inventario.agregarObjeto(cuchillo)
	CuchilloEscenario.haSidoAgarrado = true
	objetoBase.queue_free()
	super()
