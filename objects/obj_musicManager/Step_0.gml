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
			// Play the song and store its instance in a variable
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
if(songInstance != noone && audio_exists(songInstance)){
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
	
		audio_sound_gain(songInstance, fadeInInstanceVolume * _finalVolume, 0);
	}
}

// Fading songs out (Lengkap dengan pengaman total agar bebas bug/warning)
var i = 0;
while (i < array_length(fadeOutInstances)) {
    var _inst = fadeOutInstances[i];
    
    // Jika instans suara sudah tidak ada/mati, bersihkan dari array secara aman
    if (!audio_exists(_inst) || !audio_is_playing(_inst)) {
        array_delete(fadeOutInstances, i, 1);
        array_delete(fadeOutInstanceVolume, i, 1);
        array_delete(fadeOutInstanceTime, i, 1);
        continue; // Lanjut tanpa mengubah index i
    }
    
    // Fade the Volume
    if(fadeOutInstanceTime[i] > 0){
        if(fadeOutInstanceVolume[i] > 0){
            fadeOutInstanceVolume[i] -= 1/fadeOutInstanceTime[i];
        }
    }
    else{
        fadeOutInstanceVolume[i] = 0;
    }
    
    audio_sound_gain(_inst, fadeOutInstanceVolume[i] * _finalVolume, 0);
    
    // Stop the song when volume is 0 and remove it from arrays
    if(fadeOutInstanceVolume[i] <= 0){
        if(audio_is_playing(_inst)){
            audio_stop_sound(_inst);
        }
        array_delete(fadeOutInstances, i, 1);
        array_delete(fadeOutInstanceVolume, i, 1);
        array_delete(fadeOutInstanceTime, i, 1);
    } else {
        i++;
    }
}