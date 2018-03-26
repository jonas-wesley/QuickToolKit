extends "res://Qtoolkit/quick.gd"

var colors

func _ready():
	colors = require_library("misc/colors.gd")
func _init():
	print("Module initialized")
