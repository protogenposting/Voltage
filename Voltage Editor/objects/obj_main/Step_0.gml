section += mouse_wheel_down() - mouse_wheel_up()

if(section < 0)
{
	section = 0	
}

if(keyboard_check(vk_control))
{
	if(keyboard_check_pressed(ord("S")))
	{
		//save the file
		save_file(
			data,
			GetSaveFileName(".json","level.json","","freaky")
		)
	}
	if(keyboard_check_pressed(ord("L")))
	{
		//save the file
		data = load_file(
			GetOpenFileName(".json","level.json","","deaky")
		)
	}
}