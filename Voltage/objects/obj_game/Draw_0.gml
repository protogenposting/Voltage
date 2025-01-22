var _x = 0

var _laneWidth = screenWidth / totalLanes

var _laneHeight = 32

repeat(totalLanes)
{
	draw_rectangle(_x,upperBarLocation - _laneHeight / 2,_x + _laneWidth,upperBarLocation + _laneHeight / 2,true)
	
	draw_rectangle(_x,lowerBarLocation - _laneHeight / 2,_x + _laneWidth,lowerBarLocation + _laneHeight / 2, true)
	_x += _laneWidth	
}

for (var i = 0; i < array_length(loadedNotes); i++)
{
	var _note = loadedNotes[i]
	
	var _timing = songMilliseconds - _note.time
	
	var _y = 0
	
	if(_note.type == noteTypes.tap || _note.type == noteTypes.hold)
	{
		_y = lowerBarLocation + _timing * scrollSpeed
	}
	
	if(_note.type == noteTypes.swipeL || _note.type == noteTypes.swipeR)
	{
		_y = upperBarLocation - _timing * scrollSpeed
	}
	
	for(var o = 0; o < totalLanes; o++)
	{
		var _x = _laneWidth * o + _laneWidth / 2
		if(_note.sections[o])
		{
			if(_note.type == noteTypes.tap)
			{
				draw_sprite_ext(spr_tap,0,_x,_y,_laneWidth/64,_laneHeight/64,0,c_white,1)
			}
			if(_note.type == noteTypes.hold)
			{
				var _nextY = lowerBarLocation + (songMilliseconds - _note.sections[o]) * scrollSpeed
				
				var _sizeY = _y - _nextY
				
				show_debug_message(_sizeY)
				
				var _holdY = (_y + _nextY) / 2
				
				draw_sprite_ext(spr_hold,0,_x,_holdY,_laneWidth/64,_sizeY/64,0,c_white,1)
			}
			if(_note.type == noteTypes.swipeL)
			{
				draw_sprite_ext(spr_swipe_left,0,_x,_y,_laneWidth/64,_laneHeight/64,0,c_white,1)
			}
			if(_note.type == noteTypes.swipeR)
			{
				draw_sprite_ext(spr_swipe_right,0,_x,_y,_laneWidth/64,_laneHeight/64,0,c_white,1)
			}
		}
	}
}