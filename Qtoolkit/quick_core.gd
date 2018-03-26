extends "res://Qtoolkit/quick_process.gd"


class QuickCore extends Node:
	"""
	@ Class / Method description
	"""
	static func echo(string):
		print(string)
	

class QuickFile:
	"""
	@ Class / Method description
	"""
	
	static func open(_file):
		"""
		@ Class / Method description
		"""
		var file = File.new()
		file.open(_file, file.READ)
		var content = file.get_as_text()
		file.close()
		return content
	
	static func require(module_path, module_download):
		"""
		@ Class / Method description
		"""
		
		var f = File.new()
		module_path = 'res://Qtoolkit/modules/public/' + module_path
		if !f.file_exists(module_path):
			print("module: " + module_path + " no exist, download? : " + str(module_download))
			if module_download:
				# download module
				print("downloading:  " + module_path + " module, please wait...")
		else:
			var module = load(module_path).new()
			# include module
			print("<" + module_path + "> [added]")
			# return module object
			return module
	
	func require_qlib(module_path):
		"""
		@ Class / Method description
		"""
		
		var f = File.new()
		if !f.file_exists(module_path):
			print("module: <" + module_path + "> [no exist]")
		else:
			var module = load(module_path).new()
			# include module
			print("<" + module_path + "> [added]")
			# return module object
			return module
	
class QuickScript:
	"""
	@ Class / Method description
	"""
	
	# load modules
	var consts = QuickFile.require_qlib('res://Qtoolkit/libs/const.gd')
	
	func verifyQuickScript(arg):
		"""
		@ Class / Method description
		"""
		var qs = consts.QTK_SCRIPT
		var count = qs.length()
		var is_qs = false
		
		for i in range(count):
			if arg[i] == qs[i]:
				is_qs = true
				continue
			else:
				is_qs = false
				break;
		
		return is_qs
	
	func interpretHeader(arg):
		"""
		@ Class / Method description
		"""
		var libs = {}
		var coments = {}
		var qs = consts.QTK_SCRIPT
		var count = qs.length()
		var end = false
		var chars = arg.length()
		
		# remove qs indicator
		arg = arg.substr(count, arg.length())
		count = arg.length()
		
		for i in range(count):
			if arg[i]=="#" or arg[i]==":":
				if arg[i]==":":
					# this is a class
					end = true
					break
			else:
				if !end:
					continue
				else:
					break;
		return arg
	

func require_library(library_name):
	"""
	@ Class / Method description
	"""
	var library
	var library_path = 'res://Qtoolkit/libs/' + library_name
	
	if !File.new().file_exists(library_path):
		print("Framework library: <" + library_path + "> [no exist]")
	else:
		var libraryExist = frameworkSearchLibrary(library_name)
		
		if !libraryExist:
			library = load(library_path).new()
			# include module
			print("<" + library_path + "> [added]")
			
			frameworkAddLibrary(library_name, library_path, library)
			
		else:
			library = libraryExist
		
		return library
	

func require(module_path, module_download):
	"""
	@ Class / Method description
	"""
	
	var f = File.new()
	module_path = 'res://Qtoolkit/modules/public/' + module_path
	if !f.file_exists(module_path):
		print("module: " + module_path + " no exist, download? : " + str(module_download))
		if module_download:
			# download module
			print("downloading:  " + module_path + " module, please wait...")
	else:
		var module = load(module_path).new()
		# include module
		print("<" + module_path + "> [added]")
		# return module object
		return module