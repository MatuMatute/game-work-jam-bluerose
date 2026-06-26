class_name RecetaIdea extends Resource

@export var primerItem : Item
@export var segundoItem : Item
@export var resultado : Pista
@export var dialogoAlTenerExito : DialogueResource

func confirmarCrafteo(primerItemRecibido : Item, segundoItemRecibido : Item) -> Pista:
	if primerItemRecibido == segundoItemRecibido:
		return null
	
	if primerItemRecibido == primerItem or primerItemRecibido == segundoItem:
		if segundoItemRecibido == primerItem or segundoItemRecibido == segundoItem:
			DialogueManager.show_dialogue_balloon(dialogoAlTenerExito)
			return resultado
	
	return null
