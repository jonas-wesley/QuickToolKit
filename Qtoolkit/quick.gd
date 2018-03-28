extends "res://Qtoolkit/quick_core.gd"

var applicationProperties = {}

func about():
	"""
	Welcome, QuickToolKit contains some fast functions to you use.
	written by: Jonas Wesley(trancecode) and contributors
	
	Copyright (c) 2017-2018 QuickToolKit
	"""
	# Load constants lib
	var consts = require_library("const")
	# Show welcome message
	echo(PRINT, "QuickToolKit " + consts.QTK_VERSION + "| OS: " + str(OS.get_name()))
	# Destroy (consts) 
	consts.free()
	
	


func _init():
	"""
	@ Class Constructor
	"""
	
	applicationProperties = {
		"appTitle" : "My Godot/QTK App",
		"appDisplay" : Vector2(240, 240),
		"appBackgroundColor" : "A9A9A9",
		"appMainScene" : "Main.tscn",
		"appResolutionDialog" : false
	}
	

func _ready():
	"""
	@ Method description
	"""
	get_tree().set_auto_accept_quit(false)

func _notification(what):
	"""
	@ Method description
	"""
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		# Execute functions before App finalized
		print('QuickToolKit app finalized.')
		OS.delay_msec(100)
		get_tree().quit()
	

func setAppProperties():
	"""
	@ Method description
	"""
	var error = 0
	var msg = null
	
	if applicationProperties.size() != 0 && !applicationProperties["appResolutionDialog"]:
		
		var prop = applicationProperties
		
		if prop["appTitle"] != null:
			OS.set_window_title(prop["appTitle"])
		else:
			error += 1
			msg += " [SetTitleError], "
		
		if prop["appDisplay"] != null:
			OS.window_size = prop["appDisplay"]
		else:
			error += 1
			msg += " [SetDisplayError]"
		
		if prop["appBackgroundColor"] != null:
			ProjectSettings.set_setting("rendering/environment/default_clear_color", prop["appBackgroundColor"])
		else:
			error += 1
			msg = " [SetBackgroundColorError]"
		
		if error == 0:
			print("App set settings okay...")
		else:
			print("App set settings error...")
			print("Error message: ", msg)
	
	elif applicationProperties["appResolutionDialog"]:
		
		var GUI = require_library("gui/resolutions")
		var title = applicationProperties["appTitle"] + " - Game Configuration"
		
		OS.set_window_title(title)
		OS.window_size = GUI.RES_DIALOG #Vector2(445, 380)
		GUI.free()
		
		OS.window_resizable = false
		
	
	else:
		print("[Error] App settings has empty...")
	

func startApplication():
	"""
	@ Method description
	"""
	if applicationProperties["appMainScene"] != null:
		if applicationProperties["appResolutionDialog"]:
			get_tree().change_scene("res://Qtoolkit/exts/resolution_dialog.tscn")
		else:
			get_tree().change_scene(applicationProperties["appMainScene"])
	else:
		echo(ERROR, "Error, main scene not defined.")
	







