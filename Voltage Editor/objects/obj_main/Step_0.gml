section += mouse_wheel_down() - mouse_wheel_up()

if(section < 0)
{
	section = 0	
}

if(keyboard_check_pressed(vk_space))
{
	if(music == undefined)
	{
		music = audio_play_sound(songStream,1000,false)
	}
	else
	{
		audio_stop_all()
	
		music = undefined	
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
}