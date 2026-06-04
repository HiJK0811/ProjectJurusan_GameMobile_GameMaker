var _finalVolume = global.musicVolume * global.masterVolume;

// Play the target song
if(songAsset != targetSongAsset){
	// Fade out previous song
	if(audio_is_playing(songInstance)){
		array_push(fadeOutInstances, songInstance);
		array_push(fadeOutInstanceVolume, fadeInInstanceVolume);
		array_push(fadeOutInstanceTime, endFadeOutTime);
		
		songInstance = noone;
		songAsset = noone;
	}
		
	// Play the song, if old song has faded out
	if(array_length(fadeOutInstances) == 0){
		if(audio_exists(targetSongAsset)){
			// Play the song and store it's instance in a variable
			songInstance = audio_play_sound(targetSongAsset, 4, true);
		
			// Start the song's volume at zero
			audio_sound_gain(songInstance, 0, 0);
			fadeInInstanceVolume = 0;
		}
	
		// Set the songAsset to match the targetSongAsset
		songAsset = targetSongAsset;
	}
}

// Volume Control
	// Main Song Volume
	if(audio_is_playing(songInstance)){
		// Fade the song in
		if(startFadeInTime > 0){
			if(fadeInInstanceVolume < 1 ){
				fadeInInstanceVolume += 1/startFadeInTime;
			}
			else{
				fadeInInstanceVolume = 1;
			}
		}
	
		// Immediately start the song if fade-in time is 0 frames
		else{
			fadeInInstanceVolume = 1;
		}
	
		audio_sound_gain(songInstance, fadeInInstanceVolume * _finalVolume, 0)
	}
	
	// Fading songs out
	// 00:36:30
	for(var i = 0; i < array_length(fadeOutInstances); i++){
		// Fade the Volume
		if(fadeOutInstanceTime[i] > 0){
			if(fadeOutInstanceVolume[i] > 0){
				fadeOutInstanceVolume[i] -= 1/fadeOutInstanceTime[i];
			}
		}
		// Immediately cut volume to 0 otherwise
		else{
			fadeOutInstanceVolume[i] = 0;
		}
		
		audio_sound_gain(fadeOutInstances[i], fadeOutInstanceVolume[i] * _finalVolume, 0);
		
		// Stop the song when volume is 0 and removes it from all arrays
		if(fadeOutInstanceVolume[i] <= 0){
			// Stop the song
			if(audio_is_playing(fadeOutInstances[i])){
				audio_stop_sound(fadeOutInstances[i])
				array_delete(fadeOutInstances, i, 1);
				array_delete(fadeOutInstanceVolume, i, 1);
				array_delete(fadeOutInstanceTime, i, 1);
				i--;
			}
		}
	}