if(ticksLeft > 0)
{
	timeUntilNextTick -= delta_time / 1000
	
	if(timeUntilNextTick <= 0)
	{
		audio_play_sound(snd_hit_sound,1000,false)
		timeUntilNextTick = timeBetweenTicks	
		
		ticksLeft--
		
		if(ticksLeft == 0)
		{
			music = audio_play_sound(musicStream,1000,false)	
		}
	}
}

if(music != undefined)
{
	songMilliseconds = audio_sound_get_track_position(music) * 1000
}

update_notes()