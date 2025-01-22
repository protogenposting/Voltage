menu.Draw()

var _tileSize = 64

var _beatLength = (60/data.bpm * 1000) / 4

var _x = 256

var _displayedRows = zoom

var _startTime = section * _displayedRows * _beatLength

var _yStart = 64

var _y = _yStart

var _time = _startTime

repeat(_displayedRows)
{	
	_x = 256
	
	draw_line(_x,_y,_x + (fieldWidth) * _tileSize,_y)
	
	var _xPointer = 0
	repeat(fieldWidth)
	{
		if(music != undefined && _time == snap(_beatLength,audio_sound_get_track_position(music)*1000))
		{
			draw_rectangle(_x,_y,_x+fieldWidth * _tileSize,_y+_tileSize,false)
		}
		
		draw_line(_x,_yStart,_x,_yStart+_tileSize * 8)
		
		if(point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+_tileSize,_y+_tileSize))
		{
			draw_rectangle(_x,_y,_x+_tileSize,_y+_tileSize,false)
			
			if(mouse_check_button_pressed(mb_left))
			{				
				var _note = note_at_time(_time)
				
				if(_note > -1)
				{
					lastPress = [_note,_xPointer]
					
					data.notes[_note].sections[_xPointer] = !data.notes[_note].sections[_xPointer]
					
					var _found = 0
					
					for(var pointer = 0; pointer < fieldWidth; pointer++)
					{
						_found += data.notes[_note].sections[pointer]
					}
					
					if(data.notes[_note].sections[_xPointer] == false)
					{
						lastPress[0] = -1
					}
					
					if(_found == 0)
					{
						array_delete(data.notes,_note,1)
					}
				}
				else
				{
					var _sections = array_create(fieldWidth,false)
					
					_sections[_xPointer] = true
					
					array_push(data.notes,new note(_time,noteType,_sections))
					
					lastPress = [array_length(data.notes) - 1,_xPointer]
					
					break
				}
			}
			
			if(mouse_check_button_released(mb_left) && noteType == 1 && lastPress[0] != -1)
			{
				var _lastTime = _time - data.notes[lastPress[0]].time
				
				data.notes[lastPress[0]].sections[lastPress[1]] = _time
			}
			
			show_debug_message(_time)
		}
		
		_x += _tileSize
		
		_xPointer++
	}
	
	_y += _tileSize
		
	_time += _beatLength
}

for(var i = 0; i < array_length(data.notes); i++)
{
	var _note = data.notes[i]
	
	var _y = ((_note.time - _startTime) / _beatLength) * _tileSize + _yStart 
	
	var _x = 256
	
	for(var o = 0; o < fieldWidth; o++)
	{
		if(_note.sections[o])
		{
			if(_note.type == 0)
			{
				draw_sprite(spr_bar,0,_x + _tileSize / 2,_y + _tileSize / 2)
			}
			if(_note.type == 1)
			{
				var _endY = ((_note.sections[o] - _startTime) / _beatLength) * _tileSize + _yStart 
				draw_rectangle(_x,_y,_x + _tileSize,_endY + _tileSize,false)
			}
		}
		_x += _tileSize
	}
}