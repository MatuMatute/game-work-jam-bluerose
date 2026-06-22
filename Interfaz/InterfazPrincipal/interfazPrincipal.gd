class_name InterfazPrincipal extends CanvasLayer

var escenaLibroPistas : PackedScene = preload("res://Interfaz/InterfazPrincipal/LibroDePistas/libroPistas.tscn")
var libroPistas : LibroPistas
var escenaInventario : PackedScene = preload("res://Inventario/inventarioUI.tscn")
var inventarioUI

@onready var sonidoEscritura : AudioStreamPlayer = $Escritura
@onready var animacionesFondo : AnimationPlayer = $AnimacionesFondo
@onready var notificacionLibroPistas : Panel = $ContenedorBotones/BotonLibroPistas/Notificacion

func _ready() -> void:
	VariablesJugador.interfazPrincipal = self

func activarNotificacionLibroPistas() -> void:
	if not sonidoEscritura.playing: sonidoEscritura.play()
	if libroPistas == null:
		notificacionLibroPistas.show()

func BotonLibroPistasPresionado() -> void:
	if notificacionLibroPistas.is_visible_in_tree():
		notificacionLibroPistas.hide()
	
	if libroPistas == null:
		libroPistas = escenaLibroPistas.instantiate()
		add_child(libroPistas)
		animacionesFondo.play("fundidoAOscuro")
	elif not libroPistas.animacionLibroPistas.is_playing():
		libroPistas.animacionLibroPistas.play("desaparecer")
		animacionesFondo.play("fundidoATransparente")
		await libroPistas.animacionLibroPistas.animation_finished
		libroPistas.queue_free()


func BotonInventarioPresionado() -> void:
	if inventarioUI == null:
		inventarioUI = escenaInventario.instantiate()
		add_child(inventarioUI)
	else:
		inventarioUI.queue_free()
		inventarioUI = null
	
