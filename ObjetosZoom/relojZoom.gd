class_name RelojZoom extends ObjetoZoom

var reloj : Item = preload("res://Inventario/items/reloj.tres")

func Comportamiento() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/relojDialogo.dialogue"))
	await DialogueManager.dialogue_ended
	
	Inventario.agregarObjeto(reloj)
	CajoneraEscenario.haSidoAgarrado = true
	objetoBase.queue_free()
	super()
