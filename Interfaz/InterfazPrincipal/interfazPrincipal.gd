class_name InterfazPrincipal extends CanvasLayer

signal libroPistasAbierto()
signal libroPistasCerrado()

var escenaLibroPistas : PackedScene = preload("res://Interfaz/InterfazPrincipal/libroPistas.tscn")
var libroPistas : LibroPistas

func BotonLibroPistasPresionado() -> void:
	if libroPistas == null:
		libroPistas = escenaLibroPistas.instantiate()
		add_child(libroPistas)
		libroPistasAbierto.emit()
	elif not libroPistas.animacionLibroPistas.is_playing():
		libroPistas.animacionLibroPistas.play("desaparecer")
		libroPistasCerrado.emit()
		await libroPistas.animacionLibroPistas.animation_finished
		libroPistas.queue_free()

func BotonInventarioPresionado() -> void:
	print("Aca Dani tenes que hacer aparecer al inventario")
