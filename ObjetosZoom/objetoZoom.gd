class_name ObjetoZoom extends CanvasLayer

const DURACION_ANIMACION = 0.5
const CENTRO_PANTALLA = Vector2(896.0, 476.0)

@onready var fondo : TextureRect = $Fondo
@onready var posicionMouse : Vector2 = get_viewport().get_mouse_position()

# Aca el nodo entra en escena, con una animacion Tween
func _ready() -> void:
	var animacionAlAparecer : Tween = create_tween()
	animacionAlAparecer.set_parallel(true)
	animacionAlAparecer.tween_property(fondo, "position", CENTRO_PANTALLA - fondo.size / 2, DURACION_ANIMACION).from(posicionMouse - fondo.size / 2)
	animacionAlAparecer.tween_property(fondo, "scale", Vector2.ONE, DURACION_ANIMACION).from(Vector2.ZERO)
	animacionAlAparecer.connect("finished", Comportamiento)

# Aca el nodo se va de la escenam, con otra animacion Tween
func Comportamiento() -> void:
	var animacionAlIrse : Tween = create_tween()
	animacionAlIrse.set_parallel(true)
	animacionAlIrse.tween_property(fondo, "position", posicionMouse - fondo.size / 2, DURACION_ANIMACION)
	animacionAlIrse.tween_property(fondo, "scale", Vector2.ZERO, DURACION_ANIMACION)
	await animacionAlIrse.finished
	queue_free()
