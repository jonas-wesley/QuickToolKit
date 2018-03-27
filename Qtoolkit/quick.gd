extends "res://Qtoolkit/quick_core.gd"

var applicationProperties = {}

func about():
	"""
	Welcome, QuickToolKit contains some fast functions to you use.
	written by: Jonas Wesley(trancecode) and contributors
	
	Copyright (c) 2017-2018 QuickToolKit
	"""
	# Load constants lib
	var consts = require_library("const.gd")
	# Show welcome message
	echo(PRINT, "QuickToolKit " + consts.QTK_VERSION + "| OS: " + str(OS.get_name()))
	# Destroy (consts) 
	consts.free()


func _init():
	"""
	@ Class Constructor
	"""
	
	applicationProperties = {
		"appTitle" : "My QTK App",
		"appDisplay" : Vector2(540, 480),
		"appBackgroundColor" : "A9A9A9",
		"appMainScene" : "Main.tscn"
	}
	

func _ready():
	get_tree().set_auto_accept_quit(false)

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		# Execute functions before App finalized
		print('QuickToolKit app finalized.')
		OS.delay_msec(100)
		get_tree().quit()
	

func setAppProperties():
	
	var error = 0
	var msg = null
	
	if applicationProperties.size() != 0:
		
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
		
	else:
		print("[Error] App settings has empty...")
	

func startApplication():
	if applicationProperties["appMainScene"] != null:
		get_tree().change_scene(applicationProperties["appMainScene"])
	else:
		echo(ERROR, "Error, main scene not defined.")
	







