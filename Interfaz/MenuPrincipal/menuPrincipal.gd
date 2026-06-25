class_name MenuPrincipal extends CanvasLayer

@onready var contenedorMargen : MarginContainer = $ContenedorMargen
@onready var contenedorVertical : VBoxContainer = $ContenedorMargen/ContenedorVertical
@onready var animacionesMenu : AnimationPlayer = $AnimacionesMenu

var menuContenedor : VBoxContainer

func _ready() -> void:
	pass # Replace with function body.

func cambiarMenu(escena : PackedScene) -> void:
	animacionesMenu.play("desaparecer")
	await animacionesMenu.animation_finished
	contenedorVertical.hide()
	menuContenedor = escena.instantiate()
	contenedorMargen.add_child(menuContenedor)
	animacionesMenu.play("aparecer")

func regresar() -> void:
	animacionesMenu.play("desaparecer")
	await animacionesMenu.animation_finished
	if menuContenedor != null: menuContenedor.queue_free()
	contenedorVertical.show()
	animacionesMenu.play("aparecer")
