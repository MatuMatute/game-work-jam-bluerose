extends Node

const tamañoFuenteLetras : Array[int] = [
	32,
	40,
	48
]

enum Progreso {
	PROLOGO = 0,
	CONVERSACION_ELENA = 1,
	LLEGAR_ESCENA_CRIMEN = 2,
	LLEGADO_ESCENA_CRIMEN = 3,
	CONVERSACION_LORENZO = 4,
	OFICINA_LORENZO = 5,
	LLEGADO_OFICINA_LORENZO = 6,
	DIMENSION_OSCURA = 7,
	LLEGADO_DIMENSION_OSCURA = 8,
	CONFRONTACION_LORENZO = 9,
	CAPITULO_1_COMPLETADO = 10
}

var pistas : Array[Pista] 
var progresoActual : Progreso
var interfazPrincipal : InterfazPrincipal
var slotAgarrado : Slot
var indiceFuenteLetras : int

func _ready() -> void:
	if OS.has_feature("web_android") or OS.has_feature("web_ios"):
		indiceFuenteLetras = 2

func AgregarPista(pista : Pista) -> void:
	pistas.append(pista)
	interfazPrincipal.activarNotificacionLibroPistas()

func RemoverPistas(pistasAEliminar : Array[Pista]) -> void:
	for pista : Pista in pistasAEliminar:
		pistas.erase(pista)

func TienePista(pista : Pista) -> bool:
	return pista in pistas

func AjustarIndiceFuente(indice : int) -> void:
	indiceFuenteLetras = indice

func ConseguirIndiceFuente() -> int:
	return indiceFuenteLetras;

func ConseguirTamañoFuente() -> int:
	return tamañoFuenteLetras[indiceFuenteLetras]
