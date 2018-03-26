extends Node

var callback = ''

func newTimer(timer_name, one_shot, wait_time, process_mode, timer_out):
	timer_name = Timer.new()
	timer_name.set_one_shot(one_shot)
	timer_name.set_timer_process_mode(process_mode)
	timer_name.set_wait_time(wait_time)
	timer_name.connect("timeout", self, "endTimer")
	timer_name.start()
	
	callback = timer_out
	
	return timer_name

func endTimer():
	
	if callback=='':
		print('timer...')
	else:
		get_tree().get_root().call(callback)

