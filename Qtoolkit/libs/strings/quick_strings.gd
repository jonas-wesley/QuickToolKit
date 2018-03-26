extends "res://Qtoolkit/quick.gd"

var consts = QuickFile.require_qlib('res://Qtoolkit/libs/const.gd')

func split_string(string):
	"""
	if you use a data in the format:
	var a1 = '123, 4567'
	can use this function to return a Vector2() with the position x and y of the string
	x = 123
	y = 4567
	"""
	var chars = int(string.length())
	var x = ''
	var y = ''
	for i in range(0, chars):
		if string[i]==",":
			var _x_ = x + ", "
			y = string.substr(_x_.length(), consts.BASE_OCTAL)
			break;
		else:
			x += string[i]
	
	return Vector2(int(x), int(y))
	
func twitter_hashtag(text):
	var chars = text.length()
	var hash_ = 0
	var result = ''
	for i in range(0, chars):
		if text[i]=="#":
			hash_ += 1
			for n in range(i, chars):
				if text[n] != " " and text[n] != ",":
					result += text[n]
				else:
					result += " "
					break
		else:
			continue
	return result + "\n total of " + str(hash_) + " #hashtag"
	
