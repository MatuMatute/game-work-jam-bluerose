class_name InterfazPrincipal extends CanvasLayer

var escenaLibroPistas : PackedScene = preload("res://Interfaz/InterfazPrincipal/LibroDePistas/libroPistas.tscn")
var libroPistas : LibroPistas
var escenaInventario : PackedScene = preload("res://Inventario/inventarioUI.tscn")
var inventarioUI

@onready var sonidoEscritura : AudioStreamPlayer = $Escritura
@onready var animacionesFondo : AnimationPlayer = $AnimacionesFondo
@onready var notificacionLibroPistas : Panel = $ContenedorBotones/BotonLibroPistas/Notificacion
@onready var notificacionInventario : Panel = $ContenedorBotones/BotonInventario/Notificacion

func _ready() -> void:
	VariablesJugador.interfazPrincipal = self
	Inventario.interfazPrincipal = self

func activarNotificacionLibroPistas() -> void:
	if not sonidoEscritura.playing: sonidoEscritura.play()
	if libroPistas == null:
		notificacionLibroPistas.show()

func activarNotificacionInventario() -> void:
	if inventarioUI == null:
		notificacionInventario.show()

func BotonLibroPistasPresionado() -> void:
	if notificacionLibroPistas.is_visible_in_tree():
		notificacionLibroPistas.hide()	
	
	if VariablesJugador.tutorialLibroVisto == false:
		VariablesJugador.tutorialLibroVisto = true
		
		var dialogoTutorialLibroPistas : DialogueResource = load("res://Dialogos/tutorialLibroPistas.dialogue")
		DialogueManager.show_dialogue_balloon(dialogoTutorialLibroPistas)
		await DialogueManager.dialogue_ended
	
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
	if notificacionInventario.is_visible_in_tree():
		notificacionInventario.hide()
	
	if VariablesJugador.tutorialInventarioVisto == false:
		VariablesJugador.tutorialInventarioVisto = true
		
		var dialogoTutorialInventario : DialogueResource = load("res://Dialogos/tutorialInventario.dialogue")
		DialogueManager.show_dialogue_balloon(dialogoTutorialInventario)
		await DialogueManager.dialogue_ended
	
	if inventarioUI == null:
		inventarioUI = escenaInventario.instantiate()
		add_child(inventarioUI)
	else:
		inventarioUI.queue_free()
		inventarioUI = null
	
	Inventario.interfazInventario = inventarioUI
