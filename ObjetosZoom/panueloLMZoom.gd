class_name PanueloLMZoom extends ObjetoZoom

var panueloLM : Item = preload("res://Inventario/items/panueloLM.tres")

func Comportamiento() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/panueloLMDimensionOscura.dialogue"))
	await DialogueManager.dialogue_ended
	
	Inventario.agregarObjeto(panueloLM)
	PanueloLMEscenario.haSidoAgarrado = true
	objetoBase.queue_free()
	super()
