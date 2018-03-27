extends Node

var Date = load("res://Qtoolkit/libs/sys/date.gd").new()

const COUT = "Console output--> "

func outputError(arg, tree):
	"""
	@ Method description
	"""
	OS.alert(arg + "  [QTK App finalized]",'Critical rror')
	tree.quit()
	

func outputWarning(arg):
	"""
	@ Method description
	"""
	print("[WARNING]")
	print(COUT, arg)
	print("[/WARNING]")
	
	

func outputPrint(arg):
	"""
	@ Method description
	"""
	print(COUT, arg)

func outputLog(arg):
	"""
	@ Method description
	"""
	var date = Date.date(2)
	var hours = Date.hours()
	
	arg = "[" + date + "][" + hours + "] \n" + arg
	
	var Log = File.new()
	var name = "cout_log_" + str(OS.get_unix_time()) + ".log"
	var path =  "res://Qtoolkit/logs/" + name
	Log.open(path, Log.WRITE)
	Log.store_string(arg)
	
	if Log.file_exists(path):
		print(COUT, "Log [" + path + "] generated.")
		Log.close()
	else:
		print(COUT, "Error generate log...")
		Log.close()
	
