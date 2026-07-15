display_set_gui_size(room_width, room_height);

if(state != ORDER_STATE.MINIGAME || !show_menu)
{
    exit;
}

// =======================
// MULAI DRAW MENU
// =======================

var sec = ceil(time_left / room_speed);
var ratio = time_left / (time_limit * room_speed);

// seluruh kode draw panel
// draw_rectangle
// draw_text
// timer
// header
// for menu
// hasil
// tombol search
// tombol submit
// tombol winrate
// dst...
//----------------------------------
// PANEL REQUEST
//----------------------------------

var px = 220;
var py = 25;
var pw = 430;
var ph = 155;

draw_set_alpha(0.45);
draw_set_color(c_black);
draw_roundrect(px,py,px+pw,py+ph,false);

draw_set_alpha(1);

draw_set_color(make_color_rgb(70,220,255));
draw_roundrect(px,py,px+pw,py+ph,true);
draw_set_alpha(1);

draw_set_color(c_yellow);

draw_text(
    px+110,
    py+15,
    "SORT & SEARCH"
);
draw_set_color(c_white);

draw_text(
    px+20,
    py+42,
    "Urutkan menu berdasarkan harga"
);
draw_sprite_ext(
    current_portrait,
    0,
    px+35,
    py+98,
    2,
    2,
    0,
    c_white,
    1
);
draw_set_color(c_yellow);

draw_text(
    px+80,
    py+78,
    req_text
);
draw_set_color(c_white);

draw_text_ext(
    px+80,
    py+102,
    dialog_req,
    18,
    250
);


draw_text(
    menu_panel_x + 20,
    menu_panel_y + 20,
    "TIME : " + string(sec)
);
var bar_w = 300;
var bar_h = 18;

  draw_set_color(c_maroon);
// HEADER
draw_set_color(c_aqua);

draw_text(menu_start_x + 10 ,menu_header_y,"MENU");
draw_text(menu_start_x + 140,menu_header_y,"HARGA");
draw_text(menu_start_x + 250,menu_header_y,"RASA");
draw_text(menu_start_x + 330,menu_header_y,"KATEGORI");

draw_set_color(c_aqua);

draw_line(
    menu_start_x,
    menu_line_y,
    menu_start_x + 400,
    menu_line_y
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

   /*var start_index =
floor(
    //scroll_offset /
    menu_slot_h
);

var end_index =
min(
    start_index + //visible_rows,
    array_length(menu_data)
);*/

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

/*if(i == selected_index)
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
}*/
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

if(state == ORDER_STATE.MINIGAME && show_menu)
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