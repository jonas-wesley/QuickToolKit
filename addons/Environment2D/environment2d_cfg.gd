tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("Environment2D", "Node2D", preload("res://addons/Environment2D/environment2d.gd"), preload("res://addons/Environment2D/icon.png"))

func _exit_tree():
	remove_custom_type("Environment2D")