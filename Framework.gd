extends "res://Qtoolkit/quick.gd"

# Load framework librarys
var Colors = require_library("misc/colors.gd")
var Gui = require_library("gui/resolutions.gd")
var Date = require_library("sys/date.gd")
var Consts = require_library("const.gd")

func _ready():
	applicationProperties["appTitle"] = "My new application"
	applicationProperties["appDisplay"] = Gui.QVGA
	applicationProperties["appBackgroundColor"] = Colors.DeepSkyBlue
	
	setAppProperties()
	startApplication()
	
	frameworkGetLibrarys()
	

