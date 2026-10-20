// =====================================
// BACKGROUND CYBERSPACE
// =====================================

draw_set_alpha(0.77);

draw_set_color(
    make_color_rgb(
        0,
        180,
        255
    )
);

draw_rectangle(
    0,
    0,
    display_get_gui_width(),
    display_get_gui_height(),
    true
);

draw_set_alpha(1);

// =====================================
// MAIN PANEL
// =====================================

draw_set_alpha(0.83);

draw_set_color(c_black);

draw_rectangle(
    180,
    40,
    1100,
    680,
   false
);

draw_set_alpha(1);

// =====================================
// PLANET PANEL
// =====================================

draw_set_color(c_aqua);

draw_rectangle(
    panel_planet_x,
    panel_planet_y,
    panel_planet_x + panel_planet_w,
    panel_planet_y + panel_planet_h,
    false
);

// =====================================
// TITLE
// =====================================

draw_set_color(c_aqua);

draw_text(
    500,
    70,
    "ARCHIVE DATABASE"
);

// =====================================
// PLANET
// =====================================
draw_sprite_ext(
    archive_sprites[archive_index],
    0,
    planet_draw_x,
    planet_y,
    planet_scale,
    planet_scale,
    planet_rotation,
    c_white,
    1
);

// =====================================
// PLANET NAME
// =====================================

draw_set_color(c_white);

draw_text(
    560,
    150,
    archive_names[archive_index]
);

// =====================================
// PLANET TITLE
// =====================================

draw_set_color(c_yellow);

draw_text(
    560,
    190,
    "\"" +
    archive_titles[archive_index]
    + "\""
);

// =====================================
// DESCRIPTION
// =====================================

draw_set_color(c_white);

draw_text_ext(
    560,
    250,
    archive_desc[archive_index],
    24,
    420
);

// =====================================
// LEFT ARROW
// =====================================

if(hover_prev)
{
    draw_set_color(c_white);
}
else
{
    draw_set_color(c_aqua);
}

draw_text(
    250,
    280,
    "<"
);

// =====================================
// RIGHT ARROW
// =====================================

if(hover_next)
{
    draw_set_color(c_white);
}
else
{
    draw_set_color(c_aqua);
}

draw_text(
    1010,
    280,
    ">"
);

// =====================================
// DOT INDICATOR
// =====================================

var dot_x = 610;
var dot_y = 575;

for(var i=0;i<array_length(archive_names);i++)
{
    if(i == archive_index)
    {
        draw_set_color(c_white);
    }
    else
    {
        draw_set_color(c_gray);
    }

    draw_circle(
        dot_x + i * 30,
        dot_y,
        6,
        false
    );
}

// =====================================
// CLOSE BUTTON
// =====================================

if(hover_close)
{
    draw_set_color(c_white);
}
else
{
    draw_set_color(c_red);
}

draw_rectangle(
    btn_close_x,
    btn_close_y,
    btn_close_x + btn_close_w,
    btn_close_y + btn_close_h,
	false
);

draw_set_color(c_black);

draw_text(
    btn_close_x +
    (btn_close_w - string_width("CLOSE")) / 2,

    btn_close_y +
    (btn_close_h - string_height("CLOSE")) / 2,

    "CLOSE"
);