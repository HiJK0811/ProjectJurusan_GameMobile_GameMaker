
// ================= ASYNC SOCIAL EVENT =================

var _type = async_load[? "type"];

if (_type == "video_start") {
    video_started = true;
    show_debug_message("[VIDEO] Mulai diputar");
}

if (_type == "video_end") {
    video_finished = true;
    show_debug_message("[VIDEO] Selesai");

    video_close();
    room_goto(next_room);
}
