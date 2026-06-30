extends Node

func _unhandled_input(_event: InputEvent) -> void:
	if OS.has_feature("editor"):
		if Input.is_action_just_pressed("debug_quit"):
			get_tree().quit()

func _ready() -> void:
	pass
