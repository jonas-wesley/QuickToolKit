extends Node

var frameworkCurrentLibs = {}
var frameworkLib = {}

var frameworkCurrentMods = {}
var frameworkMods = {}

func _init():
	"""
	@ Class Constructor
	"""
	frameworkCurrentLibs = {
	"total" : 0,
	"has_library" : false,
	"library": frameworkLib
	}
	
	frameworkCurrentMods = {
		"total" : 0,
		"has_module" : false,
		"module" : frameworkMods
	}
	

func frameworkAddLibrary(library_name, library_path, library_pointer):
	"""
	@ Framework add new library
	"""
	frameworkCurrentLibs["total"] += 1
	var ID = frameworkCurrentLibs["total"]
	
	frameworkCurrentLibs["has_library"] = true
	frameworkCurrentLibs["library"][library_name] = {}
	frameworkCurrentLibs["library"][library_name]["library_path"] = library_path
	frameworkCurrentLibs["library"][library_name]["pointer"] = library_pointer
	
	frameworkCurrentLibs["library"][ID] = library_path
	
	#frameworkGetLibrarys()
	

func frameworkSearchLibrary(library_name):
	"""
	@ Framework add new library
	"""
	if !frameworkCurrentLibs["library"].has(library_name):
		return false
	else:
		var pointerToLibrary = frameworkCurrentLibs["library"][library_name]["pointer"]
		return pointerToLibrary
	

func frameworkGetLibrarys():
	var total = frameworkCurrentLibs["total"]
	
	print("--- Total librarys in use: [" + str(total) + "] ---")
	
	for i in range(total):
		
		if i == 0:
			i = 1
		
		print("<" + frameworkCurrentLibs["library"][i] + "> [OK]")
	
	return frameworkCurrentLibs






func frameworkAddModule(module_name, module_path, module_pointer):
	"""
	@ Framework add new library
	"""
	# Update modules and generate a new ID
	frameworkCurrentMods["total"] += 1
	var ID = frameworkCurrentMods["total"]
	
	frameworkCurrentMods["has_module"] = true
	frameworkCurrentMods["module"][module_name] = {}
	frameworkCurrentMods["module"][module_name]["module_path"] = module_path
	frameworkCurrentMods["module"][module_name]["pointer"] = module_pointer
	
	frameworkCurrentMods["module"][ID] = module_path
	
	#frameworkGetLibrarys()
	

func frameworkSearchModule(module_name):
	"""
	@ Framework add new library
	"""
	if !frameworkCurrentMods["module"].has(module_name):
		return false
	else:
		var pointerToModule = frameworkCurrentMods["module"][module_name]["pointer"]
		return pointerToModule
	

func frameworkGetModules():
	var total = frameworkCurrentMods["total"]
	
	print("--- Total modules in use: [" + str(total) + "] ---")
	
	for i in range(total):
		
		if i == 0:
			i = 1
		
		print("<" + frameworkCurrentMods["module"][i] + "> [OK]")
	
	
	return frameworkCurrentMods
	