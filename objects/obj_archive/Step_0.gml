var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

planet_rotation += 0.2;
// =====================================
// HOVER
// =====================================
if(mouse_check_button_pressed(mb_left))
{
    show_debug_message("CLICK DETECTED");
}
hover_prev =
point_in_rectangle(
    mx,
    my,
    220,
    250,
    300,
    330
);

hover_next =
point_in_rectangle(
    mx,
    my,
    980,
    250,
    1060,
    330
);

hover_close =
point_in_rectangle(
    mx,
    my,
    btn_close_x,
    btn_close_y,
    btn_close_x + btn_close_w,
    btn_close_y + btn_close_h
);
if(hover_close)
{
    show_debug_message("HOVER CLOSE");
}
// =====================================
// DOT HOVER
// =====================================

hover_dot = -1;

var dot_x = 610;
var dot_y = 575;

for(var i=0;i<array_length(archive_names);i++)
{
    if(
        point_distance(
            mx,
            my,
            dot_x + i * 30,
            dot_y
        ) < 12
    )
    {
        hover_dot = i;
    }
}

// =====================================
// CLICK
// =====================================
planet_draw_x = lerp(
    planet_draw_x,
    planet_target_x,
    0.12
);
if(mouse_check_button_pressed(mb_left))
{
    if(hover_prev)
    {
		planet_draw_x = planet_x - 250;
        archive_target_index--;

        if(archive_target_index < 0)
        {
            archive_target_index =
            array_length(archive_names)-1;
        }
    }

    if(hover_next)
    {
		planet_draw_x = planet_x + 250;

        archive_target_index++;

        if(
            archive_target_index >=
            array_length(archive_names)
        )
        {
            archive_target_index = 0;
        }
    }

    if(hover_dot != -1)
    {
        archive_target_index =
        hover_dot;
    }

    
    if(hover_close)
    {
		global.archive_open = false;
instance_destroy();
    }


    drag_archive = true;
    drag_start_x = mx;
}

// =====================================
// RELEASE
// =====================================

if(mouse_check_button_released(mb_left))
{
    if(drag_archive)
    {
        var dist =
        mx - drag_start_x;

        if(dist > 100)
        {
            archive_target_index--;

            if(archive_target_index < 0)
            {
                archive_target_index =
                array_length(archive_names)-1;
            }
        }

        if(dist < -100)
        {
            archive_target_index++;

            if(
                archive_target_index >=
                array_length(archive_names)
            )
            {
                archive_target_index = 0;
            }
        }
    }

    drag_archive = false;
}

// =====================================
// SMOOTH SLIDE
// =====================================

slide_x = lerp(
    slide_x,
    archive_target_index,
    slide_speed
);
if(abs(planet_draw_x - planet_target_x) < 1)
{
    planet_draw_x = planet_target_x;
}

if(
    abs(slide_x - archive_target_index)
    < 0.01
)
{
    slide_x = archive_target_index;

    archive_index =
    archive_target_index;
}
// =====================================
// PLANET ROTATION
// =====================================

switch(archive_index)
{
    case 0: // Agorais 4T
        planet_rotation += 0.08;
    break;

    case 1: // Amuta B27
        planet_rotation += 0.25;
    break;

    case 2: // Iced DIST367
        planet_rotation += 0.15;
    break;
}

if(planet_rotation >= 360)
{
    planet_rotation -= 360;
}
//scale plannet
planet_scale = lerp(
    planet_scale,
    0.8,
    0.1
);