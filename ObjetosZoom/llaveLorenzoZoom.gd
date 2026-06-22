class_name LlaveLorenzoZoom extends ObjetoZoom

# DANI, Aca hay que reemplazar el valor por el recurso del item de la llave del despacho de Lorenzo.
var llaveLorenzo : Item = preload("res://Inventario/items/fragmentoLlave2.tres")

func Comportamiento() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/fragmentoLlave2.dialogue"))
	await DialogueManager.dialogue_ended
	
	Inventario.agregarObjeto(llaveLorenzo)
	FragmentoLlave2Escenario.haSidoAgarrado = true
	objetoBase.queue_free()
	super()
