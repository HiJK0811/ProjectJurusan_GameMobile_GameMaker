// Turn off
if(currentState == logicState.ON){
	set_state(logicState.OFF)
	if (!audio_is_playing(snd_switchOff)) {
		audio_play_sound(snd_switchOff, 0, false);
	}
}
// Turn On
else if(currentState == logicState.OFF){
	set_state(logicState.ON)
	if (!audio_is_playing(snd_switchOn)) {
		audio_play_sound(snd_switchOn, 0, false);
	}
}

// Check if the builder exists and the game IS NOT beaten yet
if (instance_exists(obj_circuitBuilder) && !obj_circuitBuilder.level_completed) {
    obj_circuitBuilder.moves_made += 1;
}