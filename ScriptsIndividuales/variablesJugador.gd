extends Node

enum Progreso {
	PROLOGO = 0,
	CONVERSACION_ELENA = 1,
	CAPITULO_1_COMPLETADO = 2
}

var pistas : Array[Pista] = [preload("uid://w3f1nv24w1cp"), preload("uid://c53kj5ij8xawr"), preload("uid://uamkua543xln"), preload("uid://c5oaymhgpe3ij")]
var progresoActual : Progreso
var interfazPrincipal : InterfazPrincipal

func AgregarPista(pista : Pista) -> void:
	pistas.append(pista)
	interfazPrincipal.activarNotificacionLibroPistas()

func RemoverPistas(pistasAEliminar : Array[Pista]) -> void:
	for pista : Pista in pistasAEliminar:
		pistas.erase(pista)
