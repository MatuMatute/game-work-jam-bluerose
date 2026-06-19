class_name InterfazPrincipal extends CanvasLayer

var escenaLibroPistas : PackedScene = preload("res://Interfaz/InterfazPrincipal/libroPistas.tscn")
var libroPistas : LibroPistas

@onready var sonidoEscritura : AudioStreamPlayer = $Escritura
@onready var animacionesFondo : AnimationPlayer = $AnimacionesFondo
@onready var notificacionLibroPistas : Panel = $ContenedorBotones/BotonLibroPistas/Notificacion

func _ready() -> void:
	VariablesJugador.interfazPrincipal = self

func activarNotificacionLibroPistas() -> void:
	sonidoEscritura.play()
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
	print("Aca Dani tenes que hacer aparecer al inventario")
