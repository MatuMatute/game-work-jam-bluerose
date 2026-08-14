class_name FondoDialogo extends CanvasLayer

@onready var animacionFundido : AnimationPlayer = $FundidoFondo

func animacionFinalizada(anim_name: StringName) -> void:
	if anim_name == "fundidoATransparente":
		queue_free()
