// =====================================
// ARCHIVE DATA
// =====================================
show_debug_message("ARCHIVE CREATED");
archive_index = 0;
archive_target_index = 0;

archive_names =
[
    "Agorais 4T",
    "Amuta B27",
    "Iced DIST367"
];

archive_titles =
[
    "Pijakan Sang Penjelajah",
    "Planet Dewa Kematian",
    "Planet of Death Challenger"
];

archive_desc =
[
    "Planet yang dirumorkan memiliki kehidupan setara dengan planet Bken. Planet berdebu yang telah melewatkan masa emasnya dan menjadi pijakan awal para penjelajah sebelum menuju dunia yang lebih berbahaya.",

    "Planet gas raksasa pemakan planet dengan gravitasi tidak normal. Badai raksasanya diperkirakan memiliki kecepatan yang menandingi rotasi planetnya sendiri sehingga dijuluki Dewa Kematian dalam semesta.",

    "Planet es dengan hujan berlian mematikan. Kaya akan sumber daya tetapi penuh ancaman. Semakin dekat ke pusat badai semakin berharga sumber dayanya sehingga dikenal sebagai Planet of Death Challenger."
];

// =====================================
// PLANET SPRITE
// =====================================

archive_sprites =
[
    spr_plannet_1,
    spr_plannet_2,
    spr_plannet_3
];

// =====================================
// SMOOTH
// =====================================

slide_x = 0;
slide_speed = 0.15;

// =====================================
// HOVER
// =====================================

hover_prev = false;
hover_next = false;
hover_close = false;

hover_dot = -1;

// =====================================
// SWIPE
// =====================================

drag_archive = false;
drag_start_x = 0;
// =====================================
// CLOSE BUTTON
// =====================================

btn_close_x = 560;
btn_close_y = 620;

btn_close_w = 160;
btn_close_h = 50;

planet_rotation = 0;
planet_scale = 0.8;
planet_x = 380;
planet_y = 280;

switch(archive_index)
{
    case 0:
        planet_scale = 0.18;
    break;

    case 1:
        planet_scale = 0.12;
    break;

    case 2:
        planet_scale = 0.15;
    break;
}

panel_planet_x = 220;
panel_planet_y = 120;

panel_planet_w = 280;
panel_planet_h = 280;

planet_x =
panel_planet_x +
panel_planet_w * 0.5;

planet_y =
panel_planet_y +
panel_planet_h * 0.5;

planet_scale = 0.15;
planet_rotation = 0;

btn_close_x = 540;
btn_close_y = 620;

btn_close_w = 200;
btn_close_h = 50;
planet_target_x = planet_x;
planet_draw_x = planet_x;
visible = true;