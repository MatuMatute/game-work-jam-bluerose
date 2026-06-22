extends Node

var objetos: Array[Item] = []

#agrega en el array
func agregarObjeto(objetoId:Item):
	objetos.append(objetoId)
	print("Objeto agregado:", objetoId)
	#muestro el inventario para llevar un control¿
	print(objetos)

#verifica que este
func tieneObjeto(objetoId:Item):
	return objetoId in objetos
