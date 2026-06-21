class_name CuchilloZoom extends ObjetoZoom

func Comportamiento() -> void:
	# Dani, aca va el dialogo de Michael cuando agarra la navaja, y agregar la navaja al inventario
	DialogueManager.show_dialogue_balloon(load("res://Dialogos/ChiaraMichaelPrologo.dialogue"))
	await DialogueManager.dialogue_ended
	# Dani, la funcion "super" ejecuta la funcion de la clase base, es como un metodo virtual y override en C#, cuando ejecutas la funcion usando "base."
	super()
