extends CanvasLayer

@onready var settings: CanvasLayer = $Settings

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file.call_deferred("res://Scenes/GameLevel.tscn")


func _on_settings_button_pressed() -> void:
	settings.show()


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_back_button_pressed() -> void:
	settings.hide()
