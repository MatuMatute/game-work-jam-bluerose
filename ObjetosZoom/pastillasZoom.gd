class_name PastillasZoom extends ObjetoZoom

var pastillas : Item = preload("res://Inventario/items/pastillas.tres")
var pistaLorenzoEstresado : Pista = preload("res://Pistas/LorenzoEstresado.tres")

func Comportamiento() -> void:
	Inventario.agregarObjeto(pastillas)
	VariablesJugador.AgregarPista(pistaLorenzoEstresado)
	CajonEscenario.haSidoAgarrado = true
	objetoBase.queue_free()

func Regresar(event : InputEvent) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	if !CajonEscenario.haSidoAgarrado:
		return
	
	super.Comportamiento()
