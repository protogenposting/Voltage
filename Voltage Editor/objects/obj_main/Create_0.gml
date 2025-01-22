function song_data() constructor{
	notes = []
	name = ""
	bpm = 120
}

function note(_time,_type,_sections = array_create(fieldWidth,false)) constructor{
	time = _time
	type = _type
	sections = _sections
}

function note_at_time(_time)
{
	for(var i = 0; i < array_length(data.notes); i++)
	{
		if(data.notes[i].time == _time && data.notes[i].type == noteType)
		{
			return i
		}
	}
	return -1
}

#macro fieldWidth 12

#macro screenWidth camera_get_view_width(view_camera[0])

#macro screenHeight camera_get_view_height(view_camera[0])

data = new song_data()

section = 0

menu = new MenuContainer()

songStream = undefined

music = undefined

obj_main.songStream = audio_create_stream("song.ogg")

noteType = 0

lastTime = 0

currentMilliseconds = 0

lastPress = [0,0]

zoom = 8

menu.AddButton(
	"Bpm "+string(data.bpm),
	spr_button,
	new Vector2(96,64),
	new Vector2(128,64),
	function(){
		show_debug_message(obj_main.data)
		var _value = get_integer("bpm",obj_main.data.bpm)
		if(_value != undefined)
		{
			obj_main.data.bpm = _value
			text = "Bpm "+string(obj_main.data.bpm)
		}
	}
)