function song_data() constructor{
	levels = []
	name = ""
	bpm = 120
}

function note(_time,_type,_sections) constructor{
	time = _time
	type = _type
	sections = _sections
}

data = new song_data()

section = 0

menu = new MenuContainer()

songStream = undefined

menu.AddButton(
	"Bpm "+string(data.bpm),
	spr_button,
	new Vector2(96,64),
	new Vector2(128,64),
	function(){
		var _value = get_integer("bpm",obj_main.data.bpm)
		if(_value != undefined)
		{
			obj_main.data.bpm = _value
			text = "Bpm "+string(obj_main.data.bpm)
		}
	}
)

menu.AddButton(
	"Load Song",
	spr_button,
	new Vector2(96,128),
	new Vector2(128,64),
	function(){
		if(obj_main.songStream != undefined)
		{
			audio_destroy_stream(obj_main.songStream)
		}
		
		var _file = GetOpenFileName(".ogg","song.ogg","","freaky deaky!")
		
		if(_file != "")
		{
			obj_main.songStream = audio_create_stream(_file)
		}
	}
)