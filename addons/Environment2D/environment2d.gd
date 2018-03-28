extends "res://Qtoolkit/quick.gd"

# Load framework libs
var Colors = require_library("misc/colors")

# Export variables section
# Background color
export(String, "Black", "White", "Blue", "Grey" ) var backgroundColor
export(bool) var useHexColor
export(String) var BgHexColor = "000000"
# Background image
export(bool) var useImage
export(bool) var resizeBackground
export(Texture) var backgrounImage
# Environment weather
export(String, "Normal", "Snow", "Wind", "Rain") var theWeather
export(Texture) var snowTexture
#export(Texture) var rainTexture
export(bool) var backgroundSound
export(String, "None", "Repeat") var loopSound
export(AudioStream) var sound

var ScreeWidth = ProjectSettings.get_setting("display/window/size/width")
var screenHeight = ProjectSettings.get_setting("display/window/size/height")
var Anim = Tween.new()

var renderObjects = { "total" : 0, "has_object" : false }

var currentBackgroundColor
var cam

const ADD = 'add'
const DELETE = 'delete'
const GET = 'get'

func _process(delta):
	"""
	@ Method description
	"""
	if renderObjects.has("BackgroundSound"):
		if !renderObjects['BackgroundSound'].is_playing() && loopSound=="Repeat":
			print('Repeat sound.')
			renderObjects['BackgroundSound'].play()
		
	



func _ready():
	"""
	@ Method description
	"""
	# Verify camera2D
	verifyCamera()
	
	if useImage:
		setBackgroundImage()
	
	# Set background color
	if useHexColor:
		changeBackgroundColor(BgHexColor)
	else:
		setBackgroundColor()
	
	if theWeather == "Snow":
		snow()
	elif theWeather == "Rain":
		rain()
	
	add_child(Anim)
	
	# Connect signals
	get_tree().connect("screen_resized", self, "screenResized")
	
	if backgroundSound:
		environmentSound()
	

func environmentSound():
	"""
	@ Method description
	"""
	var newSound = AudioStreamPlayer.new()
	newSound.stream = sound
	newSound.play()
	add_child(newSound)
	
	renderEnvironmentObjects(ADD, "BackgroundSound", newSound)
	print(renderEnvironmentObjects(GET, "BackgroundSound", null))
	

func changeBackgroundColor(BackgroundColor):
	"""
	@ Method description
	This method is responsible for change the background color
	"""
	ProjectSettings.set_setting("rendering/environment/default_clear_color", BackgroundColor)
	currentBackgroundColor = BackgroundColor


func setBackgroundColor():
	"""
	@ Method description
	Has the same effect as changeBackgroundColor
	"""
	if backgroundColor == "Black":
		changeBackgroundColor(Colors.Black)
	elif backgroundColor == "White":
		changeBackgroundColor(Colors.White)
	elif backgroundColor == "Blue":
		changeBackgroundColor(Colors.Blue)
	else:
		changeBackgroundColor(Colors.Gray)
	

func setBackgroundImage():
	"""
	@ Method description
	This method is responsible for creating and configuring a new background texture
	"""
	# Create create a new TextureRect
	var backImg = TextureRect.new()
	# Set TextureRect
	backImg.texture = backgrounImage
	backImg.rect_size = Vector2(ScreeWidth, screenHeight)
	backImg.expand = true
	# Add background in Camera
	cam.add_child(backImg)
	# If resize changed
	if resizeBackground:
		backgrounImage = backImg

func verifyCamera():
	"""
	@ Method description
	"""
	if has_node("Camera2D"):
		print('Camera2D okay.')
		cam = $Camera2D
		cam.anchor_mode = cam.ANCHOR_MODE_FIXED_TOP_LEFT
		cam.make_current()
	else:
		print("Creating Camera2D...")
		cam = Camera2D.new()
		cam.anchor_mode = cam.ANCHOR_MODE_FIXED_TOP_LEFT
		cam.make_current()
		add_child(cam)
	

func screenResized():
	"""
	@ Method description
	"""
	if resizeBackground && useImage:
		var newScreenSizeX = get_viewport().get_visible_rect().size.x 
		var newScreenSizeY = get_viewport().get_visible_rect().size.y
		
		backgrounImage.rect_size = Vector2(newScreenSizeX, newScreenSizeX)
	


func transition(toColor):
	"""
	@ Method description
	"""
	Anim.interpolate_property(ProjectSettings , "rendering/environment/default_clear_color", Color(currentBackgroundColor), Color(toColor), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	Anim.start()
	
	currentBackgroundColor = toColor
	

func snow():
	"""
	@ Method description
	"""
	# Create new particle system
	var snow = Particles2D.new()
	# Configure particle system
	snow.position = Vector2(500, -345)
	snow.scale = Vector2(17, 11)
	snow.amount = 100
	snow.lifetime = 10
	# Set materials
	snow.process_material = load("res://addons/Environment2D/Materials/Snow.tres")
	snow.texture = snowTexture
	# Add on scene
	cam.add_child(snow)
	
	renderEnvironmentObjects(ADD, "Snow", snow)
	

func rain():
	"""
	@ Method description
	"""
	# Create new particle system
	var rain = Particles2D.new()
	# Configure particle system
	rain.position = Vector2(0, -10)
	rain.amount = 200
	rain.lifetime = 10
	rain.speed_scale = 2
	# Set materials
	rain.process_material = load("res://addons/Environment2D/Materials/Rain.tres")
	rain.process_material.emission_box_extents = Vector3(ScreeWidth, -10, 0)
	# Add on scene
	cam.add_child(rain)
	
	renderEnvironmentObjects(ADD, "Rain", rain)
	

func applyFakeForce(Weather):
	
	pass

func renderEnvironmentObjects(option, type, object):
	
	if option == ADD:
		renderObjects[type] = object
		renderObjects['total'] += 1
		renderObjects['has_object'] = true
		
	elif option == DELETE:
		renderObjects[type].queue_free()
	else:
		return renderObjects[type]
	
	print("Environment object added")
	#print(renderObjects)
