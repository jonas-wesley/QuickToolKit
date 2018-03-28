extends "res://Qtoolkit/quick_process.gd"

export(String) var ENVIRONMENT = DEVELOPMENT

var cout = require_library("sys/console_output")


var TypeFile = File.new()

func echo(type, arg):
	"""
	@ Class / Method description
	"""
	if type == PRINT:
		cout.outputPrint(arg)
	elif type == ERROR:
		# Finalize app
		cout.outputError(arg, get_tree())
	elif type == WARNING:
		cout.outputWarning(arg)
	elif type == LOG:
		cout.outputLog(arg)
	else:
		cout.outputPrint("Echo error, type not exist.")
	


func require_library(library_name):
	"""
	@ Class / Method description
	"""
	var ext = get_environment()
	var library
	var library_path = 'res://Qtoolkit/libs/' + library_name + ext
	
	if !TypeFile.file_exists(library_path):
		print("Framework library: <" + library_path + "> [no exist]")
	else:
		var libraryExist = frameworkSearchLibrary(library_name)
		
		if !libraryExist:
			library = load(library_path).new()
			# include module
			#print("Framework library: <" + library_path + "> [added]")
			
			frameworkAddLibrary(library_name, library_path, library)
			
		else:
			library = libraryExist
		
		return library
	


func require(module_name, module_download):
	"""
	@ Class / Method description
	"""
	var ext = get_environment()
	var module
	var module_path = 'res://Qtoolkit/modules/public/' + module_name + ext
	
	if !TypeFile.file_exists(module_path):
		print("Inner module: <" + module_path + "> [no exist]")
	else:
		var moduleExist = frameworkSearchModule(module_name)
		
		if !moduleExist:
			module = load(module_path).new()
			# include module
			#print("Extern module: <" + module_path + "> [added]")
			
			frameworkAddModule(module_name, module_path, module)
			
		else:
			module = moduleExist
		
		return module
	
<<<<<<< HEAD

func get_environment():
	"""
	@ Class / Method description
	"""
	var ext
	if ENVIRONMENT == DEVELOPMENT:
		ext = ".gd"
	else:
		ext = ".gdc"
	
	return ext
=======
>>>>>>> 4c317aedee84a100cc3abe20be832a6ce6b51b90
