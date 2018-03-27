extends Node

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
	