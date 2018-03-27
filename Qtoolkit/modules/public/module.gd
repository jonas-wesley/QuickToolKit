extends "res://Qtoolkit/quick.gd"

var colors

func _ready():
	colors = require_library("misc/colors.gd")

func returnNum(num):
	return num * num

func _http_connect(host, port):
	var http = HTTPClient.new();
	http.connect(host, port)
	return http

func _init():
	pass #print("Module initialized")