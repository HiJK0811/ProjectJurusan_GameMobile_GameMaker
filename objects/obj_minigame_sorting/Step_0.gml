// =====================================================
// STATE MACHINE
// =====================================================
hover_menu = -1;

for(var i=0;i<array_length(menu_data);i++)
{
    var yy =
        menu_start_y +
        i*menu_slot_h;

    if(point_in_rectangle(
        mouse_x,
        mouse_y,
        menu_start_x,
        yy,
        menu_start_x+menu_width,
        yy+menu_slot_h
    ))
    {
        hover_menu = i;
    }
}
switch(state)
{
    // =================================================
    // ARRIVAL
    // =================================================

    case ORDER_STATE.ARRIVAL:
	if(!npc_arrived)
{
    npc_x += npc_speed;

    if(npc_x >= npc_target_x)
    {
        npc_x = npc_target_x;
        npc_arrived = true;
    }
}
else
{
    npc_arrived = true;
}

if(npc_arrived)
{
    if(mouse_check_button_pressed(mb_left))
    {
        state = ORDER_STATE.MINIGAME;
    }
}


    break;

    // =================================================
    // MINIGAME
    // =================================================

    case ORDER_STATE.MINIGAME:
	hover_menu = -1;
	hover_menu = -1;

for(var i=0;i<array_length(menu_data);i++)
{
    var yy =
        menu_start_y +
        i * menu_slot_h;

    if(point_in_rectangle(
        mouse_x,
        mouse_y,
        menu_start_x,
        yy,
        menu_start_x + menu_width,
        yy + menu_slot_h
    ))
    {
        hover_menu = i;
        break;
    }
}



hover_search =
point_in_rectangle(
    mouse_x,
    mouse_y,
    btn_search_x,
    btn_search_y,
    btn_search_x + btn_search_w,
    btn_search_y + btn_search_h
);

hover_winrate =
point_in_rectangle(
    mouse_x,
    mouse_y,
    btn_winrate_x,
    btn_winrate_y,
    btn_winrate_x + btn_winrate_w,
    btn_winrate_y + btn_winrate_h
);

hover_submit =
point_in_rectangle(
    mouse_x,
    mouse_y,
    btn_submit_x,
    btn_submit_y,
    btn_submit_x + btn_submit_w,
    btn_submit_y + btn_submit_h
);

can_submit =
(search_result != "");

        // =============================================
        // TIMER
        // =============================================

        if(time_left > 0)
        {
            time_left--;
        }
        else
        {
            time_up = true;

            success = false;

            timeout_count++;
            wrong_count++;
			array_push(
    customer_log,
    npc_name + "  [TIMEOUT]"
);

            npc_reaction =
                "Waktunya habis.";

            state =
                ORDER_STATE.REACTION;
        }


    // =============================================
// PRESS
// =============================================

if(mouse_check_button_pressed(mb_left))
{
    if(hover_menu != -1)
    {
        drag_start_x = mouse_x;
        drag_start_y = mouse_y;

        drag_index = hover_menu;
        hover_index = hover_menu;

        click_candidate = true;
    }
}
        // =============================================
        // START DRAG
        // =============================================

        if(mouse_check_button(mb_left))
{
    if(click_candidate)
{
    if(
        point_distance(
            drag_start_x,
            drag_start_y,
            mouse_x,
            mouse_y
        ) > 10
    )
    {
        is_dragging = true;
        click_candidate = false;
    }
}
}

        // =============================================
        // DRAG UPDATE
        // =============================================

        if(is_dragging)
        {
            hover_index =
                floor(
                    (mouse_y - menu_start_y)
                    / menu_slot_h
                );

            hover_index =
                clamp(
                    hover_index,
                    0,
                    array_length(menu_data)-1
                );
        }

        // =============================================
        // RELEASE DRAG
        // =============================================

        if(mouse_check_button_released(mb_left))
        {
			if(click_candidate)
{
    click_candidate = false;

    if(selected_index == -1)
    {
        selected_index = hover_menu;
    }
    else
    {
        if(selected_index != hover_menu)
{
    var temp =
        menu_data[selected_index];

    menu_data[selected_index] =
        menu_data[hover_menu];

    menu_data[hover_menu] =
        temp;

    has_player_sorted = true;
}

        selected_index = -1;
    }
}
            if(is_dragging)
            {
                is_dragging = false;

                if(drag_index != hover_index)
                {
                    var dragged =
                        menu_data[drag_index];

                    if(drag_index < hover_index)
                    {
                        for(var i=drag_index;i<hover_index;i++)
                        {
                            menu_data[i] =
                                menu_data[i+1];
                        }
                    }
                    else
                    {
                        for(var i=drag_index;i>hover_index;i--)
                        {
                            menu_data[i] =
                                menu_data[i-1];
                        }
                    }

                    menu_data[hover_index] =
                        dragged;
						has_player_sorted = true;
                }
            }
        }

        // =============================================
        // CHECK SORTING
        // =============================================

      if(has_player_sorted)
{
    if(src_check_sorting())
    {
        is_sorted_correctly = true;
        can_search = true;
    }
    else
    {
        is_sorted_correctly = false;
        can_search = false;
    }
}
else
{
    is_sorted_correctly = false;
    can_search = false;
}

        // =============================================
        // SEARCH BUTTON
        // =============================================

        if(point_in_rectangle(
            mouse_x,
            mouse_y,
            btn_search_x,
            btn_search_y,
            btn_search_x + btn_search_w,
            btn_search_y + btn_search_h
        ))
        {
            if(mouse_check_button_pressed(mb_left))
            {
                if(can_search)
                {
                    search_result =
                        src_get_correct_answer();

                    result_message =
                        "Pencarian berhasil";
                }
                else
                {
                    search_result = "";

                    result_message =
                        "Menu belum tersortir";
                }
            }
        }

        // =============================================
        // WIN RATE
        // =============================================
		//if(!used_winrate)
//{
    if(point_in_rectangle(
            mouse_x,
            mouse_y,
            btn_winrate_x,
            btn_winrate_y,
            btn_winrate_x + btn_winrate_w,
            btn_winrate_y + btn_winrate_h
        ))
        {
            if(mouse_check_button_pressed(mb_left))
            {
                used_winrate = true;

                if(irandom(99) < 65)
                {
                    search_result =
                        src_get_correct_answer();

                    result_message =
                        "WIN RATE?";
                }
                else
                {
                    search_result =
                        menu_data[
                            irandom(
                                array_length(menu_data)-1
                            )
                        ];

                    result_message =
                        "WIN RATE";
                }
            }
        }
//}

        

        // =============================================
        // SUBMIT
        // =============================================

        if(point_in_rectangle(
            mouse_x,
            mouse_y,
            btn_submit_x,
            btn_submit_y,
            btn_submit_x + btn_submit_w,
            btn_submit_y + btn_submit_h
        ))
        {
            if(mouse_check_button_pressed(mb_left))
            {
                if(search_result == "")
                {
                    result_message =
                        "Gunakan SEARCH atau WIN RATE";
                }
                else
                {
                    correct_answer =
                        src_get_correct_answer();

                    success =
                        (search_result ==
                         correct_answer);

                    if(success)
{
    correct_count++;

    array_push(
        customer_log,
        npc_name + "  [BERHASIL]"
    );
}
else
{
    wrong_count++;

    array_push(
        customer_log,
        npc_name + "  [GAGAL]"
    );
}
                    state =
                        ORDER_STATE.RESULT;
                }
            }
        }

    break;

    // =================================================
    // RESULT
    // =================================================

    case ORDER_STATE.RESULT:

        if(mouse_check_button_pressed(mb_left))
        {
           if(success)
{
    npc_reaction =
        happy_quotes[
            irandom(array_length(happy_quotes)-1)
        ];
}
else
{
    npc_reaction =
        sad_quotes[
            irandom(array_length(sad_quotes)-1)
        ];
}

            state =
                ORDER_STATE.REACTION;
        }

    break;

    // =================================================
    // REACTION
    // =================================================

    case ORDER_STATE.REACTION:

        if(mouse_check_button_pressed(mb_left))
        {
            state =
                ORDER_STATE.LEAVE;
        }

    break;

    // =================================================
    // LEAVE
    // =================================================

    case ORDER_STATE.LEAVE:

        npc_x += 4;

        if(npc_x > room_width + 150)
        {
            current_customer++;

            if(current_customer >= total_customer)
            {
                final_accuracy =
                    round(
                        correct_count /
                        total_customer *
                        100
                    );

                if(final_accuracy >= 80)
                {
                    final_rank = "A";
                }
                else if(final_accuracy >= 60)
                {
                    final_rank = "B";
                }
                else
                {
                    final_rank = "C";
                }

                state =
                    ORDER_STATE.STAGE_COMPLETE;
            }
            else
            {
                src_generate_customer();
				

npc_x = -200;
npc_y = 120;
npc_arrived = false;


                state =
                    ORDER_STATE.ARRIVAL;
            }
        }

    break;

    // =================================================
    // COMPLETE
    // =================================================

    case ORDER_STATE.STAGE_COMPLETE:
	//sementara
	if(mouse_check_button_pressed(mb_left))
        {
            room_goto(room_explore_mainRoom)
        }

    break;
}
if(time_up)
{
    npc_reaction =
    "Kamu terlalu lama.";
}
//tombol debug minigame (back to main menu)
 if(point_in_rectangle(
            mouse_x,
            mouse_y,
            btn_backmain_x,
            btn_backmain_y,
            btn_backmain_x + btn_backmain_w,
            btn_backmain_y + btn_backmain_h
        ))
        {
            if(mouse_check_button_pressed(mb_left))
            {
				room_goto(room_explore_mainRoom)
			}
		}
/*scroll_offset = 0;
scroll_offset -= mouse_wheel_up() * 50;
scroll_offset += mouse_wheel_down() * 50;
if(mouse_wheel_up())
{
    scroll_offset -= menu_slot_h;
}

if(mouse_wheel_down())
{
    scroll_offset += menu_slot_h;
}

var max_scroll =
max(
    0,
    (array_length(menu_data) - visible_rows)
    * menu_slot_h
);

scroll_offset =
clamp(
    scroll_offset,
    0,
    max_scroll
); buat scroll*/