extends Node

var objetos: Array= []

#agrega en el array
func agregarObjeto(objetoId:String):
	objetos.append(objetoId)
	print("Objeto agregado:", objetoId)
	#muestro el inventario para llevar un control¿
	print(objetos)

#verifica que este
func tieneObjeto(objetoId:String):
	return objetoId in objetos
