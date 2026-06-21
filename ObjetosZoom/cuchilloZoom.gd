class_name CuchilloZoom extends ObjetoZoom

func Comportamiento() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/cuchillo.dialogue"))
	await DialogueManager.dialogue_ended
	Inventario.agregarObjeto("cuchillo")
	CuchilloEscenario.haSidoAgarrado = true
	objetoBase.queue_free()
	super()
