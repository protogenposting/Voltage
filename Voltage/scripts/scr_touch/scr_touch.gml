function get_tap_in_rect(_left,_top,_right,_bottom){
	var _check = obj_touch_detection.taps
	for(var i = 0; i < array_length(_check); i++)
	{
		if(point_in_rectangle(_check[i].x,_check[i].y,_left,_top,_right,_bottom))
		{
			return true	
		}
	}
	return false
}

function get_hold_in_rect(_left,_top,_right,_bottom){
	var _check = obj_touch_detection.holds
	for(var i = 0; i < array_length(_check); i++)
	{
		if(point_in_rectangle(_check[i].x,_check[i].y,_left,_top,_right,_bottom))
		{
			return true	
		}
	}
	return false
}

function get_swipe_in_rect(_left,_top,_right,_bottom){
	var _check = obj_touch_detection.swipes
	for(var i = 0; i < array_length(_check); i++)
	{
		if(point_in_rectangle(_check[i].position.x,_check[i].position.y,_left,_top,_right,_bottom))
		{
			return _check[i].velocity	
		}
	}
	return false
}