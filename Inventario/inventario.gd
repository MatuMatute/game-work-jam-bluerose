extends Node

var objetos: Array= []

#agrega en el array
func agregarObjeto(objetoId:String):
	objetos.append(objetoId)
	print("Objeto agregado:", objetoId)

#verifica que este
func tieneObjeto(objetoId:String):
	return objetoId in objetos
