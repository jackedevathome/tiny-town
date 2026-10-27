extends Node
# Autoload "GameSettings": stores player settings and saves them to disk.

const SAVE_PATH := "user://settings.cfg"

var master_volume : float = 1.0
var fullscreen : bool = false
var vsync : bool = true

func _ready() -> void:
	load_settings()
	apply()

func set_master_volume(value: float) -> void:
	master_volume = value
	apply()
	save_settings()

func set_fullscreen(value: bool) -> void:
	fullscreen = value
	apply()
	save_settings()

func set_vsync(value: bool) -> void:
	vsync = value
	apply()
	save_settings()

func apply() -> void:
	var master := AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(master, master_volume <= 0.0)
	AudioServer.set_bus_volume_db(master, linear_to_db(max(master_volume, 0.0001)))

	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

	if vsync:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

func save_settings() -> void:
	var config := ConfigFile.new()
	config.set_value("audio", "master_volume", master_volume)
	config.set_value("video", "fullscreen", fullscreen)
	config.set_value("video", "vsync", vsync)
	config.save(SAVE_PATH)

func load_settings() -> void:
	var config := ConfigFile.new()
	if config.load(SAVE_PATH) != OK:
		return
	master_volume = config.get_value("audio", "master_volume", master_volume)
	fullscreen = config.get_value("video", "fullscreen", fullscreen)
	vsync = config.get_value("video", "vsync", vsync)
