if global.cancelbreak == false{
	image_xscale = 1.5
	global.cancelbreak = true
	_get_tree()
	instance_destroy(obj_balao_text)
}