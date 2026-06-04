// Global Volume Control
global.masterVolume = 1;
global.musicVolume = 0.5;

// Info for current song
songInstance =  noone;
songAsset = noone;
targetSongAsset = noone; 
endFadeOutTime = 0;
startFadeInTime = 0;
fadeInInstanceVolume = 1;

// Fade out and stopping music
fadeOutInstances = array_create(0);
fadeOutInstanceVolume = array_create(0);
fadeOutInstanceTime = array_create(0);