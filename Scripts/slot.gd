extends ColorRect
class_name Slot

@export var SlotData : InventorySlot

func _ready() -> void:
	update_slot()

func set_data(new_data : InventorySlot):
	SlotData = new_data
	update_slot()

func update_slot():
	if SlotData == null or not SlotData.has_data():
		$TextureRect.texture = null
		$Label.text = ""
		return
	$TextureRect.texture = SlotData.get_texture()
	$Label.text = str(SlotData.quantity) if SlotData.quantity > 1 else ""
