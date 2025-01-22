enum noteTypes{
	tap,
	hold,
	swipeL,
	swipeR
}

songData = load_file(global.currentChart)

musicStream = audio_create_stream(global.currentSong + "/song.ogg")

music = undefined

loadedNotes = []

millisecondsLoadedInAdvance = 8000

songMilliseconds = 0

ticksLeft = 4

timeBetweenTicks = (60/songData.bpm) * 500

timeUntilNextTick = 0

scrollSpeed = 0.6

lowerBarLocation = screenHeight - 64

upperBarLocation = 64

function update_notes()
{
	var _notes = songData.notes
	for(var i = 0; i < array_length(_notes); i++)
	{
		if(_notes[i].time <= songMilliseconds + millisecondsLoadedInAdvance)
		{
			array_insert(loadedNotes,0,_notes[i])
			
			array_delete(_notes,i,1)
			
			i--
		}
	}
}