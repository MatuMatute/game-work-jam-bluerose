class_name FragmentoLlave1Zoom extends ObjetoZoom

var parteLlave1 : Item = preload("res://Inventario/items/fragmentoLlave1.tres")

func Comportamiento() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/fragmentoLlave1.dialogue"))
	await DialogueManager.dialogue_ended
	
	Inventario.agregarObjeto(parteLlave1)
	FragmentoLlave1Escenario.haSidoAgarrado = true
	objetoBase.queue_free()
	super()
