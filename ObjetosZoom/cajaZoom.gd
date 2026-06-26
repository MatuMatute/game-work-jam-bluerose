class_name CajaZoom extends ObjetoZoom

var necesitoLlave : Pista = load("res://Pistas/NecesitoLlave.tres")
var llaveNecesaria : Item = load("res://Inventario/items/llaveCompleta.tres")
var gemaBase : Item = load("res://Inventario/items/gemaBase.tres")

@onready var sonidoAbrir = $Abrir

func Comportamiento() -> void:
	# Si, dani
	if CajaEscenario.estado == CajaEscenario.EstadoDeLaCaja.CERRADO: 
		VariablesJugador.AgregarPista(necesitoLlave)
		CajaEscenario.estado = CajaEscenario.EstadoDeLaCaja.SIN_ABRIR

func Regresar(event : InputEvent) -> void:
	if !event is InputEventMouseButton:
		return
	if !event.button_index == MOUSE_BUTTON_LEFT:
		return
	if !event.is_released():
		return
	if CajaEscenario.estado != CajaEscenario.EstadoDeLaCaja.SIN_ABRIR:
		return
	
	super.Comportamiento()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if !event.button_index == MOUSE_BUTTON_LEFT:
			return
		if !event.is_released():
			return
		if VariablesJugador.slotAgarrado == null:
			return
		if CajaEscenario.estado != CajaEscenario.EstadoDeLaCaja.SIN_ABRIR:
			return
		
		if fondo.get_global_rect().has_point(event.global_position):
			if VariablesJugador.slotAgarrado.itemBase == llaveNecesaria:
				VariablesJugador.slotAgarrado.queue_free()
				VariablesJugador.RemoverPistas([necesitoLlave])
				CajaEscenario.estado = CajaEscenario.EstadoDeLaCaja.ABIERTO
				sonidoAbrir.play()
				Inventario.agregarObjetoYActualizar(gemaBase)
				objetoBase.input_pickable = false
				super.Comportamiento()
