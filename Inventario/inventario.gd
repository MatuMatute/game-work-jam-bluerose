extends Node

var objetos: Array[Item] = []

#agrega en el array
func agregarObjeto(objetoId:Item):
	objetos.append(objetoId)

func quitarObjeto(objetoId: Item) -> void:
	objetos.erase(objetoId)

#verifica que este
func tieneObjeto(objetoId:Item):
	return objetoId in objetos
