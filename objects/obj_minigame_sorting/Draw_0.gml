
// ================= DRAW EVENT =================
// ================= NPC PANEL =================

draw_set_alpha(0.8);
draw_set_color(c_black);

draw_rectangle(
    npc_panel_x,
    npc_panel_y,
    npc_panel_x + npc_panel_w,
    npc_panel_y + npc_panel_h,
    false
);

draw_set_alpha(1);

draw_set_color(npc_color);

draw_rectangle(
    npc_x,
    npc_y,
    npc_x + 80,
    npc_y + 120,
    false
);


draw_text(
    npc_x + 10,
    npc_y + 130,
    npc_name
);
draw_sprite_ext(
    spr_chatbox,
    0,
    220,
    100,
    0.7,
    0.7,
    0,
    c_white,
    1
);


switch(state)
{
    case ORDER_STATE.ARRIVAL:


        draw_set_color(c_white);

        draw_text(
            280,
            230,
            "Klik untuk mulai melayani"
        );

    break;

    case ORDER_STATE.MINIGAME:

        var sec = ceil(time_left / room_speed);
        var ratio = time_left / (time_limit * room_speed);
		draw_set_colour(c_yellow);

       draw_set_alpha(0.6);
draw_set_color(c_black);

draw_rectangle(
    220,
    70,
    620,
    260,
    true
);

draw_set_alpha(1);

draw_set_color(c_yellow);

draw_text(250,135,"SORT & SEARCH");
draw_text(250,175,"Urutkan menu berdasarkan harga");
draw_text(250,220,req_text);
draw_text(450,220,dialog_req);


draw_text(
    menu_panel_x + 20,
    menu_panel_y + 20,
    "TIME : " + string(sec)
);
var bar_w = 300;
var bar_h = 18;
header_y = menu_start_y - 45;
line_y   = menu_start_y - 15;
  draw_set_color(c_maroon);
// HEADER
draw_set_color(c_aqua);

draw_text(menu_start_x + 10 ,header_y,"MENU");
draw_text(menu_start_x + 140,header_y,"HARGA");
draw_text(menu_start_x + 250,header_y,"RASA");
draw_text(menu_start_x + 330,header_y,"KATEGORI");

draw_set_color(c_aqua);

draw_line(
    menu_start_x,
    line_y,
    menu_start_x + 400,
    line_y
);
draw_set_color(c_gray);

draw_rectangle(
    menu_panel_x + 20,
    menu_panel_y + 50,
    menu_panel_x + 20 + bar_w,
    menu_panel_y + 50 + bar_h,
    false
);

draw_set_color(c_lime);

draw_rectangle(
    menu_panel_x + 20,
    menu_panel_y + 50,
    menu_panel_x + 20 + (bar_w * ratio),
    menu_panel_y + 50 + bar_h,
    false
);

     for(var i=0;i<array_length(menu_data);i++)
{
    var yy =
        menu_start_y +
        i * menu_slot_h;

    // ================= HOVER =================

    if(i == hover_menu)
    {
        draw_set_alpha(0.20);
        draw_set_color(c_yellow);

        draw_rectangle(
            menu_start_x - 5,
            yy - 15,
            menu_start_x + menu_width,
            yy + 25,
            false
        );

        draw_set_alpha(1);
    }

    // ================= SELECTED =================

   if(i == selected_index)
{
    draw_set_alpha(0.30);
    draw_set_color(c_aqua);

    draw_rectangle(
        menu_start_x - 5,
        yy - 5,
        menu_start_x + menu_width,
        yy + 40,
        false
    );

    draw_set_alpha(1);
}

    // ================= DRAG =================

    if(is_dragging && i == drag_index)
    {
        draw_set_alpha(0.35);
        draw_set_color(c_lime);

        draw_rectangle(
            menu_start_x - 5,
            yy - 5,
            menu_start_x + menu_width,
            yy + 40,
            false
        );

        draw_set_alpha(1);
    }

    // ================= DROP TARGET =================

    if(is_dragging && i == hover_index)
    {
        draw_set_alpha(0.15);
        draw_set_color(c_orange);

        draw_rectangle(
            menu_start_x - 8,
            yy - 5,
            menu_start_x + menu_width + 8,
            yy + 40,
            false
        );

        draw_set_alpha(1);

        draw_set_color(c_orange);

        draw_rectangle(
            menu_start_x - 8,
            yy - 5,
            menu_start_x + menu_width + 8,
            yy + 40,
            true
        );
    }

    draw_set_color(c_white);

    var d =
        string_split(
            menu_data[i],
            "|"
        );

    draw_text(menu_start_x + 10 ,yy,d[0]);
    draw_text(menu_start_x + 170,yy,d[1]);
    draw_text(menu_start_x + 260,yy,d[2]);
    draw_text(menu_start_x + 340,yy,d[3]);

}
if(i == selected_index)
{
    draw_set_alpha(0.3);
    draw_set_color(c_aqua);

    draw_rectangle(
        menu_start_x - 5,
        yy - 5,
        menu_start_x + menu_width,
        yy + 40,
        false
    );

    draw_set_alpha(1);
}
draw_set_color(c_aqua);

draw_text(
    menu_panel_x + 30,
    menu_panel_y + 390,
    "HASIL :"
);

draw_set_color(c_white);

        draw_text(
            menu_panel_x + 30,
            menu_panel_y + 410,
            search_result
        );
		draw_set_color(c_lime);

        draw_text(
            menu_panel_x + 30,
            menu_panel_y + 430,
            result_message
        );
		

    break;

    case ORDER_STATE.RESULT:
	draw_set_color(c_white);
	draw_set_color(c_white);
	draw_set_alpha(0.7);
draw_set_color(c_black);

draw_rectangle(
    300,
    120,
    900,
    450,
    false
);

draw_set_alpha(1);
draw_set_color(c_white);

        draw_text(500,120,"ORDER RESULT");

        draw_text(
            400,
            220,
            "Requirement : " + req_text
        );

        draw_text(
            400,
            280,
            "Jawaban Benar : " + correct_answer
        );

        draw_text(
            400,
            340,
            "Pilihanmu : " + search_result
        );

        if(success)
{
    draw_set_color(c_lime);

    draw_text(
        420,
        420,
        "STATUS : BERHASIL"
    );
}
else
{
    draw_set_color(c_red);

    draw_text(
        420,
        420,
        "STATUS : GAGAL"
    );
}

draw_set_color(c_white);

    break;

    case ORDER_STATE.REACTION:
	draw_set_color(c_white);
	draw_set_alpha(0.7);
draw_set_color(c_black);

draw_rectangle(
    300,
    120,
    900,
    450,
    false
);

draw_set_alpha(1);
draw_set_color(c_white);

        draw_text(
            420,
            200,
            npc_reaction
        );

        draw_text(
            420,
            300,
            "Klik untuk lanjut"
        );

    break;

    case ORDER_STATE.LEAVE:

       

    break;

    case ORDER_STATE.STAGE_COMPLETE:
	draw_set_color(c_white);
	draw_set_alpha(0.8);
draw_set_color(c_black);

draw_rectangle(
    300,
    80,
    950,
    580,
    false
);

draw_set_alpha(1);
draw_set_color(c_white);

        draw_text(
            450,
            120,
            "MISSION REPORT"
        );

        draw_text(
            450,
            220,
            "Correct : " + string(correct_count)
        );

        draw_text(
            450,
            280,
            "Wrong : " + string(wrong_count)
        );

        draw_text(
            450,
            340,
            "Timeout : " + string(timeout_count)
        );

        draw_text(
            450,
            420,
            "Accuracy : " + string(final_accuracy) + "%"
        );

        draw_text(
            450,
            500,
            "Rank : " + final_rank
			
        );
		draw_set_color(c_white);

draw_text(
    700,
    180,
    "CUSTOMER HISTORY"
);
draw_set_color(c_white);

draw_text(
    550,
    680,
    "klik untuk menyelesaikan"
);
for(var i=0;i<array_length(customer_log);i++)
{
    var txt =
        customer_log[i];

    if(string_pos("[BERHASIL]", txt) > 0)
    {
        draw_set_color(c_lime);
    }
    else if(string_pos("[GAGAL]", txt) > 0)
    {
        draw_set_color(c_red);
    }
    else
    {
        draw_set_color(c_yellow);
    }

    draw_text(
        700,
        220 + (i * 35),
        txt
    );
}

    break;
}
if(state == ORDER_STATE.MINIGAME)
{
    if(can_search)
{
    if(hover_search)
        draw_set_color(c_aqua);
    else
        draw_set_color(c_blue);
}
else
{
    draw_set_color(c_gray);
}

draw_rectangle(
    btn_search_x,
    btn_search_y,
    btn_search_x + btn_search_w,
    btn_search_y + btn_search_h,
    false
);

draw_set_color(c_white);

draw_text(
    btn_search_x + 15,
    btn_search_y + 12,
    "SEARCH"
);
if(can_submit)
{
    if(hover_submit)
        draw_set_color(c_lime);
    else
        draw_set_color(c_green);
}
else
{
    draw_set_color(c_gray);
}

draw_rectangle(
    btn_submit_x,
    btn_submit_y,
    btn_submit_x + btn_submit_w,
    btn_submit_y + btn_submit_h,
    false
);

draw_set_color(c_white);

draw_text(
    btn_submit_x + 15,
    btn_submit_y + 12,
    "SUBMIT"
);
//if(used_winrate)
//{
    //draw_set_color(c_gray);
//}
//else
//{
    if(hover_winrate)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_orange);
//}

draw_rectangle(
    btn_winrate_x,
    btn_winrate_y,
    btn_winrate_x + btn_winrate_w,
    btn_winrate_y + btn_winrate_h,
    false
);

draw_set_color(c_white);

draw_text(
    btn_winrate_x + 8,
    btn_winrate_y + 12,
    "WIN RATE"
);

//tombol debug (back to main)
draw_set_colour(c_teal);
draw_rectangle(
    btn_backmain_x,
    btn_backmain_y,
    btn_backmain_x + btn_backmain_w,
    btn_backmain_y + btn_backmain_h,
    false
);

draw_set_color(c_white);

draw_text(
    btn_backmain_x + 10,
    btn_backmain_y + 5,
    "back to\nmain Miguel"
);

}
