@tool
extends EditorPlugin

func _enable_plugin() -> void:
	add_autoload_singleton("EZRNG", "res://addons/ez_rng/ezrng.gd")

func _disable_plugin() -> void:
	remove_autoload_singleton("EZRNG")
