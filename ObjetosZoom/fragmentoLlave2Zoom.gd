class_name FragmentoLlave2Zoom extends ObjetoZoom

var parteLlave2 : Item = preload("res://Inventario/items/fragmentoLlave2.tres")

func Comportamiento() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/fragmentoLlave2.dialogue"))
	await DialogueManager.dialogue_ended
	
	Inventario.agregarObjeto(parteLlave2)
	FragmentoLlave2Escenario.haSidoAgarrado = true
	objetoBase.queue_free()
	super()
