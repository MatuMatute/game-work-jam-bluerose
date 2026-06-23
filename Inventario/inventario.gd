extends Node

var objetos: Array[Item] = []

#agrega en el array
func agregarObjeto(objetoId:Item):
	objetos.append(objetoId)

#verifica que este
func tieneObjeto(objetoId:Item):
	return objetoId in objetos
