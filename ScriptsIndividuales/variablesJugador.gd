extends Node

enum Progreso {
	PROLOGO = 0,
	CONVERSACION_ELENA = 1,
	CAPITULO_1_COMPLETADO = 2
}

var pistas : Array[Pista] = [preload("uid://d2dy1j1338rtf"), preload("uid://c8g7tht1qd742"), preload("uid://bjqvseig10v1m")]
var progresoActual : Progreso

func AgregarPista(pista : Pista) -> void:
	pistas.append(pista)

func RemoverTresPistas(pistasAEliminar : Array[Pista]) -> void:
	for pista : Pista in pistasAEliminar:
		pistas.erase(pista)
