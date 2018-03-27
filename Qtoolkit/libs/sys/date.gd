extends Node

var Months = {}
var Days = {}

func _init():
	"""
	@ Method description
	"""
	Months = {
		1 : "January",
		2 : "February",
		3 : "March",
		4 : "April",
		5 : "May",
		6 : "June",
		7 : "July",
		8 : "August",
		9 : "September",
		10 : "October",
		11 : "Novenber",
		12 : "December"
	}
	
	Days = {
		0 : "Sunday",
		1 : "Monday",
		2 : "Tuesday",
		3 : "Wednesday",
		4 : "Thursday",
		5 : "Friday",
		6 : "Saturday"
	}

func date(Format):
	"""
	@ Method description
	"""
	var date = OS.get_date()
	var currentDay = date['day']
	var currentWeekDay = date['weekday']
	var currentMonth = date['month']
	var currentYear = date['year']
	var newDate
	
	if Format == 1:
		newDate = str(currentDay) + "(" + Days[currentWeekDay] + ") " + Months[currentMonth] + " " + str(currentYear)
	else:
		newDate = str(currentDay) + "/0" + str(currentMonth) + "/" + str(currentYear)
	
	return newDate
	

func hours():
	"""
	@ Method description
	"""
	var zh = ''
	var zm = ''
	
	var hours = OS.get_datetime()
	var currentSecond = hours['second']
	var currentMinute = hours['minute']
	var currentHour = hours['hour']
	
	if currentHour < 10:
		zh = '0'
	if currentMinute < 10:
		zm = '0'
	
	var newHour = zh + str(currentHour) + ":" + zm + str(currentMinute) + ":" + str(currentSecond)
	
	return newHour
	


