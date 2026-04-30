var curr_action = scene_info[scene_index]

var len = array_length(curr_action) - 1;

switch(len){
	case 0:
		script_execute(curr_action[0]);
		break;
	case 1:
		script_execute(curr_action[0], curr_action[1]);
		break;
	case 2:
		script_execute(curr_action[0], curr_action[1], curr_action[2]);
		break;
	case 3:
		script_execute(curr_action[0], curr_action[1], curr_action[2], curr_action[3]);
		break;
}
