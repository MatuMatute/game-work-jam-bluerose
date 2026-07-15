class_name MenuPausa extends CanvasLayer

var escenaBotonRegresar : PackedScene = preload("res://Interfaz/MenuPrincipal/regresar.tscn")

@onready var animacionesMenu : AnimationPlayer = $AnimacionesMenu
@onready var contenedorVertical : VBoxContainer = $ContenedorMargen/ContenedorVertical
@onready var contenedorMargen : MarginContainer = $ContenedorMargen

var menuContenedor : VBoxContainer

func continuarJuego() -> void:
	animacionesMenu.play_backwards("iniciar")
	await animacionesMenu.animation_finished
	get_tree().paused = false
	queue_free()

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
