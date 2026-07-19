/// obj_dialog_minigamesorting : Step
//----------------------------------------------------
// INPUT PLAYER NAME
//----------------------------------------------------

if (typing_name)
{
    // Ambil isi keyboard GameMaker
    player_name_input = keyboard_string;

    // Batasi panjang nama
    if (string_length(player_name_input) > max_name_length)
    {
        player_name_input = string_copy(
            player_name_input,
            1,
            max_name_length
        );

        keyboard_string = player_name_input;
    }

    if (keyboard_check_pressed(vk_enter))
    {
        if (string_length(player_name_input) > 0)
        {
            audio_play_sound(snd_click,1,false);

            global.player_name = player_name_input;

            keyboard_string = "";

            typing_name = false;
        }
    }

    exit;
}
if (array_length(dialog_lines) <= 0)
{
    exit;
}

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

hover_skip = point_in_rectangle(
    mx,
    my,
    skip_x,
    skip_y,
    skip_x + skip_w,
    skip_y + skip_h
);

//============================
// Typewriter
//============================

if (!finished_typing)
{
    text_length += text_speed;

    /*if (text_length >= string_length(dialog_lines[dialog_index]))
    {
        text_length = string_length(dialog_lines[dialog_index]);
        finished_typing = true;
    }*/
	var full_text = string_replace_all(
    dialog_lines[dialog_index],
    "{player}",
    global.player_name
);

if (text_length >= string_length(full_text))
{
    text_length = string_length(full_text);
    finished_typing = true;
}

}

//============================
// Skip typing
//============================

if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space))
{
    if (!finished_typing)
    {
		audio_play_sound(
    snd_click,
    1,
    false
);
        text_length = string_length(dialog_lines[dialog_index]);
        finished_typing = true;
    }
    else
    {
        dialog_index++;

        if (dialog_index >= array_length(dialog_lines))
        {
            if (caller != noone)
            {
                with(caller)
{
    state = other.next_state;
}

if(next_state==ORDER_STATE.ARRIVAL)
{
    with(caller)
    {
        //src_generate_customer();
        //src_shuffle_menu();
    }
}
            }

            instance_destroy();
            exit;
        }

        text_length = 0;
        finished_typing = false;
    }
}

//============================
// Skip seluruh dialog
//============================

if (hover_skip && mouse_check_button_pressed(mb_left))
{show_debug_message("NEXT STATE = " + string(next_state));
	audio_play_sound(
    snd_click,
    1,
    false
);
    if (caller != noone)
    {
        with (caller)
        {
            state = other.next_state;

            if (state == ORDER_STATE.ARRIVAL)
            {
                //src_generate_customer();
                //src_shuffle_menu();
            }
        }
    }
	show_debug_message("Dialog Finished");
show_debug_message("Caller = " + string(caller));
show_debug_message("Next = " + string(next_state));

    instance_destroy();
}