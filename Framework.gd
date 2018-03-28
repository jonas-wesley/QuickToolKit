extends "res://Qtoolkit/quick.gd"

# Use framework example
# Load framework librarys
var Gui = require_library("gui/resolutions")
var Date = require_library("sys/date")

func _ready():
	applicationProperties["appTitle"] = "My new application"
	applicationProperties["appBackgroundColor"] = Gl_Colors.DeepSkyBlue
	applicationProperties["appResolutionDialog"] = true
	
	setAppProperties()
	startApplication()
	

