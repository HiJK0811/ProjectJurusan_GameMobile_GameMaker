if (current_message < 0) exit;

var _str = messages[current_message].msg;

if (current_character < string_length(_str)){
	current_character += char_speed * (1 + real(keyboard_check(input_key)));
	draw_messageSubstring = string_copy(_str, 0, current_character);
}
else if (keyboard_check_released(input_key)) {
	current_message++;
	if (current_message >= array_length(messages)){
		instance_destroy();
	}
	else{
		current_character = 0;
	}
}