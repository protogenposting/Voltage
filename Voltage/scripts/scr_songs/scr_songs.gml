function song_entry(_name,_artist,_charter,_location) constructor{
	name = _name
	artist = _artist
	charter = _charter
	location = global.chartLocation + _location
}

global.chartLocation = "charts/"

global.songs = [
	new song_entry(
		"The Safari (STARDOM Remix)",
		"Konami Amusement (Takayuki Ishikawa)",
		"Protogen Posting",
		"the safari"
	)
]

global.currentChart = global.songs[0].location + "/expert.json"

global.currentSong = global.songs[0].location