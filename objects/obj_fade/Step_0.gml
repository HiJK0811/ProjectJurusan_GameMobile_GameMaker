if (fade_state == "darken"){
	fade_alpha += fade_speed;
	
	if (fade_alpha >= 1){
		fade_alpha = 1;
		
		if (target_room != noone){
			room_goto(target_room);
		}
	
		fade_state = "brighten"
	}
}
else if (fade_state == "brighten"){
	fade_alpha -= fade_speed;
	
	if (fade_alpha <= 0){
		instance_destroy();
	}
}