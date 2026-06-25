extends Node

var objetos : Array[Item]
var interfazInventario : InterfazInventario

#agrega en el array
func agregarObjeto(objetoId:Item):
	objetos.append(objetoId)

#agrega en el array
func agregarObjetoYActualizar(objetoId:Item):
	objetos.append(objetoId)
	
	if interfazInventario != null:
		interfazInventario.ActualizarInventario()

func quitarObjeto(objetoId: Item) -> void:
	objetos.erase(objetoId)

#verifica que este
func tieneObjeto(objetoId:Item):
	return objetoId in objetos
