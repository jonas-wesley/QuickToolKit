extends Control

# Under construction

onready var resolution = $Panel/Graphics/Panel/screen_resolution/OptionButton
onready var quality = $Panel/Graphics/Panel/graphics_quality/OptionButton

var userPreferences = { "graphics" : {}, "controllers" : {} }

func _ready():
	init()

func init():
	"""
	@ Method description
	"""
	# Add resolutions
	resolution.add_item("640 x 480", 0)
	resolution.add_item("720 x 480", 1)
	resolution.add_item("720 x 576", 2)
	resolution.add_item("800 x 600", 3)
	resolution.add_item("1024 x 768", 4)
	# Add qualitys
	quality.add_item("High", 0)
	quality.add_item("Medium", 1)
	quality.add_item("Low", 2)
	# Connect signals
	$Panel/Quit.connect("button_down", self, "quitApp")
	$Panel/Play.connect("button_down", self, "playApp")
	$Panel/Graphics_bts.connect("button_down", self, "setGraphics")
	$Panel/Input_bts.connect("button_down", self, "setInput")

func quitApp():
	"""
	@ Method description
	"""
	get_tree().quit()

func playApp():
	"""
	@ Method description
	"""
	OS.window_resizable = true
	get_tree().change_scene("res://Main.tscn")
	

func setGraphics():
	"""
	@ Method description
	"""
	$Panel/Input.hide()
	$Panel/Graphics.show()
	

func setInput():
	"""
	@ Method description
	"""
	$Panel/Input.show()
	$Panel/Graphics.hide()