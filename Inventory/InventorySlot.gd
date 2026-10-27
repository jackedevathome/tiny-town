class_name InventorySlot
extends Resource

@export var item_data: ItemData
@export var quantity: int

func _init(p_resource: ItemData = null, p_quantity: int = 0) -> void:
	self.item_data = p_resource
	self.quantity = p_quantity

func get_texture() -> Texture2D:
	return item_data.texture

func set_data(data : ItemData):
	item_data = data

func has_data() -> bool:
	if item_data != null:
		return true
	else:
		return false
