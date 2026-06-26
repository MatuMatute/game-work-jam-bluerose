class_name MenuPrincipal extends CanvasLayer

signal juegoEmpezarPartida(menuPrincipal : MenuPrincipal)

var escenaBotonRegresar : PackedScene = preload("res://Interfaz/MenuPrincipal/regresar.tscn")

@onready var contenedorMargen : MarginContainer = $ContenedorMargen
@onready var contenedorVertical : VBoxContainer = $ContenedorMargen/ContenedorVertical
@onready var animacionesMenu : AnimationPlayer = $AnimacionesMenu

var menuContenedor : VBoxContainer

func cambiarMenu(escena : PackedScene) -> void:
	animacionesMenu.play("desaparecer")
	await animacionesMenu.animation_finished
	contenedorVertical.hide()
	var botonRegresar : Button = escenaBotonRegresar.instantiate()
	botonRegresar.connect("pressed", regresar)
	menuContenedor = escena.instantiate()
	menuContenedor.add_child(botonRegresar)
	contenedorMargen.add_child(menuContenedor)
	animacionesMenu.play("aparecer")

func regresar() -> void:
	animacionesMenu.play("desaparecer")
	await animacionesMenu.animation_finished
	if menuContenedor != null: menuContenedor.queue_free()
	contenedorVertical.show()
	animacionesMenu.play("aparecer")

func iniciarPartida() -> void:
	animacionesMenu.play("transicion")
	await animacionesMenu.animation_finished
	juegoEmpezarPartida.emit(self)
