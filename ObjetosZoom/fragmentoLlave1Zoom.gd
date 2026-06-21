class_name FragmentoLlave1Zoom extends ObjetoZoom

func Comportamiento() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/fragmentoLlave1.dialogue"))
	await DialogueManager.dialogue_ended
	
	Inventario.agregarObjeto("fragmentoLlave")
	FragmentoLlave1Escenario.haSidoAgarrado = true
	objetoBase.queue_free()
	super()
