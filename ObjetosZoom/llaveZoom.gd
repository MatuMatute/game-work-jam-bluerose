class_name LlaveZoom extends ObjetoZoom

func Comportamiento() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/fragmentoLlave1.dialogue"))
	await DialogueManager.dialogue_ended
	
	Inventario.agregarObjeto("fragmentoLlave")
	LlaveEscenario.haSidoAgarrado = true
	objetoBase.queue_free()
	super()
