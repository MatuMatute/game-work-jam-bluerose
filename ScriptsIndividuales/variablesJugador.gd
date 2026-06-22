extends Node

enum Progreso {
	PROLOGO = 0,
	CONVERSACION_ELENA = 1,
	LLEGAR_ESCENA_CRIMEN = 2,
	LLEGADO_ESCENA_CRIMEN = 3,
	CONVERSACION_LORENZO = 4,
	CONFRONTACION_LORENZO = 5,
	CAPITULO_1_COMPLETADO = 6
}

var pistas : Array[Pista] 
var progresoActual : Progreso
var interfazPrincipal : InterfazPrincipal

func AgregarPista(pista : Pista) -> void:
	pistas.append(pista)
	interfazPrincipal.activarNotificacionLibroPistas()

func RemoverPistas(pistasAEliminar : Array[Pista]) -> void:
	for pista : Pista in pistasAEliminar:
		pistas.erase(pista)

func TienePista(pista : Pista) -> bool:
	return pista in pistas
