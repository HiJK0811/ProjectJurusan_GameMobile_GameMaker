// video selesai sendiri -> lanjut
if (video_get_status() == video_status_closed)
{
    room_goto(next_room);
    exit;
}

// klik tombol skip
if (mouse_check_button_pressed(mb_left))
{
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);

    if (point_in_rectangle(_mx, _my, skip_x, skip_y, skip_x + skip_w, skip_y + skip_h))
    {
        video_close();
        room_goto(next_room);
    }
}

// bonus: tekan Enter/Space juga bisa skip
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
{
    video_close();
    room_goto(Cutscene_Prolouge);
}