extends Node

@onready var ground: TileMapLayer = $Ground
@onready var camera: Camera2D = $Player/Camera2D

func _unhandled_input(_event: InputEvent) -> void:
	if OS.has_feature("editor"):
		if Input.is_action_just_pressed("debug_quit"):
			get_tree().quit()

func _ready() -> void:
	# Keep the camera inside the map
	var map_rect := ground.get_used_rect()
	var tile_size := ground.tile_set.tile_size
	camera.limit_left = map_rect.position.x * tile_size.x
	camera.limit_top = map_rect.position.y * tile_size.y
	camera.limit_right = map_rect.end.x * tile_size.x
	camera.limit_bottom = map_rect.end.y * tile_size.y
