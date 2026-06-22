class_name Slot extends TextureRect

var itemBase : Item

@onready var texturaObjetoItem = $texturaObjeto

func _ready() -> void:
	texturaObjetoItem.texture = itemBase.icono
