extends ColorRect
class_name Slot

@export var SlotData : InventorySlot

func _ready() -> void:
	pass

func set_data(new_data : InventorySlot):
	SlotData = new_data
	update_slot()

func update_slot():
	$Sprite2D.texture = SlotData.get_texture()
	$Label.text = SlotData.quantity
