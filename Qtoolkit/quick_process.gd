extends Node

var frameworkCurrentLibs = {}
var frameworkLib = {}

class QuickProcessManager extends Node:
	"""
	@ Class description
	"""
	
	

func _init():
	"""
	@ Class Constructor
	"""
	frameworkCurrentLibs = {
	"total" : 0,
	"has_library" : false,
	"library": frameworkLib
	}
	

func frameworkAddLibrary(library_name, library_path, library_pointer):
	"""
	@ Framework add new library
	"""
	frameworkCurrentLibs["total"] += 1
	frameworkCurrentLibs["has_library"] = true
	frameworkCurrentLibs["library"][library_name] = {}
	frameworkCurrentLibs["library"][library_name]["library_path"] = library_path
	frameworkCurrentLibs["library"][library_name]["pointer"] = library_pointer
	
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
	return frameworkCurrentLibs
