extends "res://Qtoolkit/quick.gd"

# Load framework librarys
var Colors = require_library("misc/colors.gd")
var Const = require_library("const.gd")

# Load modules
var Module = require("module.gd", false)

func _ready():
	
	print("Current librarys: ", frameworkGetLibrarys())
	about()
