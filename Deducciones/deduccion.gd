class_name Deduccion extends Resource

@export var pistas : Array[Pista]
@export var pistaResultante : Pista

func RevisarDeduccion(pistasAConfirmar : Array[Pista]) -> Pista:
	var coincidencias : int = 0
	
	for pistaRecibida : Pista in pistasAConfirmar:
		for pistaDeductoria : Pista in pistas:
			if pistaRecibida.informacion == pistaDeductoria.informacion:
				coincidencias += 1
				break
	
	if coincidencias == pistas.size():
		return pistaResultante
	else:
		return null
