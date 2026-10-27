extends CanvasLayer

@onready var settings: CanvasLayer = $Settings
@onready var volume_slider: HSlider = %VolumeSlider
@onready var fullscreen_check: CheckButton = %FullscreenCheck
@onready var vsync_check: CheckButton = %VsyncCheck

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file.call_deferred("res://Scenes/GameLevel.tscn")


func _on_settings_button_pressed() -> void:
	# Show the saved values without triggering the change signals
	volume_slider.set_value_no_signal(GameSettings.master_volume * 100)
	fullscreen_check.set_pressed_no_signal(GameSettings.fullscreen)
	vsync_check.set_pressed_no_signal(GameSettings.vsync)
	settings.show()


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_back_button_pressed() -> void:
	settings.hide()


func _on_volume_slider_value_changed(value: float) -> void:
	GameSettings.set_master_volume(value / 100.0)


func _on_fullscreen_check_toggled(toggled_on: bool) -> void:
	GameSettings.set_fullscreen(toggled_on)


func _on_vsync_check_toggled(toggled_on: bool) -> void:
	GameSettings.set_vsync(toggled_on)
