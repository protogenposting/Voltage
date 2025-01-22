section += mouse_wheel_down() - mouse_wheel_up()

noteType += keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down)

if(section < 0)
{
	section = 0	
}

if(noteType < 0)
{
	noteType = 0	
}

var _beatLength = (60/data.bpm * 1000) / 4

if(keyboard_check_pressed(vk_space))
{
	if(music == undefined)
	{
		music = audio_play_sound(songStream,1000,false)
		
		audio_sound_set_track_position(music, (section * 8 * _beatLength) / 1000)
	}
	else
	{
		audio_stop_all()
	
		music = undefined	
	}
}

if(music != undefined)
{
	lastTime = currentMilliseconds

	currentMilliseconds = snap(_beatLength,audio_sound_get_track_position(music)*1000)

	if(currentMilliseconds != lastTime)
	{
		if(note_at_time(currentMilliseconds))
		{
			show_debug_message("rizz")
			
			var _aud = audio_play_sound(snd_note_hit,1000,false)
			
			audio_sound_gain(_aud,4,0)
		}
	}
}


if(keyboard_check(vk_control))
{
	if(keyboard_check_pressed(ord("S")))
	{
		//save the file
		save_file(
			data,
			game_save_id+"/chart.json"//GetSaveFileName(".json","level.json","","freaky")
		)
	}
	if(keyboard_check_pressed(ord("L")))
	{
		//save the file
		data = load_file(
			game_save_id+"/chart.json"//GetOpenFileName(".json","level.json","","deaky")
		)
	}
	if(keyboard_check_pressed(ord("P")))
	{
		show_debug_message(data)
	}
}