if(ticksLeft > 0)
{
	timeUntilNextTick -= delta_time / 1000
	
	if(timeUntilNextTick <= 0)
	{
		audio_play_sound(snd_hit_sound,1000,false)
		timeUntilNextTick = timeBetweenTicks	
	}
}

update_notes()