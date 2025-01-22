holdsLast = holds
	
taps = []

holds = []

swipes = []

for(var i = 0; i < 50; i++)
{	
	swipes[i] = false
	
	if(device_mouse_check_button_pressed(i,mb_left))
	{
		taps[i] = new Vector2(device_mouse_x(i),device_mouse_y(i))
	}
	else
	{
		taps[i] = false	
	}
	
	if(device_mouse_check_button(i,mb_left))
	{
		holds[i] = new Vector2(device_mouse_x(i),device_mouse_y(i))
		
		if(holdsLast[i] != false)
		{
			swipes[i] = {
				position : new Vector2(holdsLast[i].x,holdsLast[i].y),
				
				velocity : new Vector2(device_mouse_x(i) - holdsLast[i].x,device_mouse_y(i)  - holdsLast[i].y)
			}
		}
	}
	else
	{
		holds[i] = false	
	}
}