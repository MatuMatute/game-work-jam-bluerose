class_name RecetaCrafteo extends Resource

@export var primerItem : Item
@export var segundoItem : Item
@export var resultado : Item

func confirmarCrafteo(primerItemRecibido : Item, segundoItemRecibido : Item) -> Item:
	if primerItemRecibido == primerItem or primerItemRecibido == segundoItem:
		if segundoItemRecibido == primerItem or segundoItemRecibido == segundoItem:
			return resultado
	
	return null
