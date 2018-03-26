extends "res://Qtoolkit/quick_core.gd"

class Quick extends Node:
	"""
	func qInterpret(file):
		var qs_file = QuickFile.open(file)
		var _is = QuickScript.verifyQuickScript(qs_file)
		if _is:
			qs_file = QuickScript.interpretHeader(qs_file)
			print(qs_file)
		else:
			print("Error in ("+file+") is not a quickscript file.")
			print(qs_file)
	"""


func about():
	"""
	Welcome, QuickToolKit contains some fast functions to you use.
	written by: Jonas Wesley(trancecode) and contributors
	
	Copyright (c) 2017-2018 QuickToolKit
	"""
	# Load constants lib
	var consts = require_library("const.gd")
	# Show welcome message
	QuickCore.echo("QuickToolKit " + consts.QTK_VERSION + "| OS: " + str(OS.get_name()))
	# Destroy (consts) 
	consts.free()


func _init():
	"""
	@ Class Constructor
	"""

func _ready():
	get_tree().set_auto_accept_quit(false)

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		# Execute functions before App finalized
		print('QuickToolKit app finalized.')
		OS.delay_msec(100)
		get_tree().quit()







