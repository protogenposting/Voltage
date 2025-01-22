menu.Draw()

var _tileSize = 64

var _beatLength = 60/data.bpm * 1000

var _x = 256

var _displayedRows = 8

var _startTime = section * _displayedRows * _beatLength

var _yStart = 64

var _y = _yStart

var _time = _startTime

repeat(_displayedRows)
{	
	_x = 256
	
	draw_line(_x,_y,_x + (fieldWidth) * _tileSize,_y)
	
	var _xPointer = 0
	repeat(fieldWidth + 1)
	{
		draw_line(_x,_yStart,_x,_yStart+_tileSize * 8)
		
		if(point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+_tileSize,_y+_tileSize))
		{
			draw_rectangle(_x,_y,_x+_tileSize,_y+_tileSize,false)
			
			if(mouse_check_button_pressed(mb_left))
			{
				var _note = note_at_time(_time)
				if(_note > -1)
				{
					data.notes[_note].sections[_xPointer] = !data.notes[_note].sections[_xPointer]
					
					var _found = 
					
					for(var pointer = 0; pointer < fieldWidth; pointer++)
					{
						data.notes[_note].sections
					}
				}
				else
				{
					array_push()
				}
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
	
	var _y = _displayedRows * _note.time - _startTime
	
	var _x = 256
	
	for(var o = 0; o < fieldWidth; o++)
	{
		if(_note.sections[o])
		{
			draw_sprite(spr_bar,0,_x + _tileSize / 2,_y + _tileSize / 2)
		}
		_x += _tileSize
	}
}