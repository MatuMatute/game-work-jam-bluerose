class_name LlaveZoom extends ObjetoZoom

func Comportamiento() -> void:
	# Dani, aca va el dialogo de Michael cuando agarra la llave, y agregar la llave al inventario
	
	await DialogueManager.dialogue_ended
	# Dani, la funcion "super" ejecuta la funcion de la clase base, es como un metodo virtual y override en C#, cuando ejecutas la funcion usando "base."
	super()
