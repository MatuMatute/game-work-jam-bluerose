class_name Slot extends TextureRect

signal fueClickeado(slot : Slot)
signal fueSoltado(slot : Slot)
signal hacerCrafting(slot : Slot)

var itemBase : Item
var manteniendoClic : bool

@onready var texturaObjetoItem = $texturaObjeto

func _ready() -> void:
	texturaObjetoItem.texture = itemBase.icono

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if !event.button_index == MOUSE_BUTTON_LEFT:
			return
		
		if event.is_pressed():
			manteniendoClic = true
			fueClickeado.emit(self)
			print(itemBase.nombre, ": Presionado")
			accept_event()
	if event is InputEventMouseMotion:
		if manteniendoClic:
			global_position = event.global_position - size / 2

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if !event.button_index == MOUSE_BUTTON_LEFT:
			return
		
		if event.is_released():
			if manteniendoClic:
				manteniendoClic = false
				fueSoltado.emit(self)
				print(itemBase.nombre, ": Soltado")
			elif get_global_rect().has_point(event.global_position):
				hacerCrafting.emit(self)
				print(itemBase.nombre, ": PosibleCrafting")

func SalioElMouse() -> void:
	if manteniendoClic and not get_parent().is_class("GridContainer"):
		fueSoltado.emit(self)
		manteniendoClic = false
