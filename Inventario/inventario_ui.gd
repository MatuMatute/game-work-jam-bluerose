class_name InterfazInventario extends Control

signal terminarDemo()

@onready var grid = $PanelContainer/CenterContainer/GridContainer

var recetas : Array[RecetaCrafteo] = [
	preload("res://Inventario/recetasCrafteos/LlaveCompleta.tres"), 
	preload("res://Inventario/recetasCrafteos/TallarGema.tres")
	]

var recetasIdeas : Array[RecetaIdea] = [
	preload("res://Inventario/recetasIdeas/recetaIniciales.tres")
]

func _ready() -> void:
	var nodoPrincipal : Juego = get_tree().current_scene as Juego
	connect("terminarDemo", nodoPrincipal.terminarDemo)
	ActualizarInventario()

func ActualizarInventario() -> void:
	if grid.get_child_count() > 0:
		for node : Node in grid.get_children():
			node.queue_free()
	
	var escenaSlot : PackedScene = load("res://Inventario/slotUI.tscn")
	
	#ITERARRRRR 
	for item : Item in Inventario.objetos: 
		var slot : Slot = escenaSlot.instantiate()
		slot.itemBase = item
		slot.connect("fueClickeado", SlotClickeado)
		slot.connect("fueSoltado", SlotSoltado)
		slot.connect("hacerCrafting", Crafting)
		grid.add_child(slot)

func SlotClickeado(slot : Slot) -> void:
	slot.reparent.call_deferred(self)
	VariablesJugador.slotAgarrado = slot

func SlotSoltado(slot : Slot) -> void:
	slot.reparent.call_deferred(grid)

func Crafting(slot : Slot) -> void:
	if VariablesJugador.slotAgarrado == null: return
	var resultado : Item
	
	for receta : RecetaCrafteo in recetas:
		resultado = receta.confirmarCrafteo(VariablesJugador.slotAgarrado.itemBase, slot.itemBase)
		if resultado != null: break
	
	if resultado != null:
		Inventario.quitarObjeto(VariablesJugador.slotAgarrado.itemBase)
		Inventario.quitarObjeto(slot.itemBase)
		Inventario.agregarObjeto(resultado)
		VariablesJugador.slotAgarrado.queue_free()
		ActualizarInventario()
	
	var ideaResultante : Pista
	
	for recetaIdea : RecetaIdea in recetasIdeas:
		ideaResultante = recetaIdea.confirmarCrafteo(VariablesJugador.slotAgarrado.itemBase, slot.itemBase)
		if ideaResultante != null: break
	
	if ideaResultante != null:
		await DialogueManager.dialogue_ended
		VariablesJugador.AgregarPista(ideaResultante)
		terminarDemo.emit()
