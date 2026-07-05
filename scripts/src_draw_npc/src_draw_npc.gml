function src_draw_npc()
{
    //---------------------------------------
    // PORTRAIT
    //---------------------------------------

    draw_set_alpha(0.8);
    draw_set_color(c_black);

    draw_roundrect(20,70,185,245,false);

    draw_set_alpha(1);

    draw_sprite_ext(
        current_portrait,
        0,
        105,
        145,
        portrait_scale,
        portrait_scale,
        0,
        c_white,
        1
    );

    draw_set_color(npc_color);
    draw_text(55,225,npc_name);

    //---------------------------------------
    // PILIH SPRITE
    //---------------------------------------

    var spr;

if(npc_arrived)
{
    spr = current_portrait;
}
else
{
    if(npc_walk_frame == 0)
        spr = current_walk1;
    else
        spr = current_idle;
}

    //---------------------------------------
    // ARAH HADAP
    //---------------------------------------

    var scale_x;

    if(state == ORDER_STATE.LEAVE)
    {
        // keluar ke kanan
        scale_x = npc_scale;
    }
    else
    {
        // masuk dari kanan ke kiri
        scale_x = npc_scale;
    }

    //---------------------------------------
    // DRAW NPC
    //---------------------------------------

    draw_sprite_ext(
        spr,
        0,
        npc_x,
        npc_y,
        scale_x,
        npc_scale,
        0,
        c_white,
        1
    );

    //---------------------------------------
    // CHATBOX
    //---------------------------------------

    if(state != ORDER_STATE.LEAVE)
    {
        draw_sprite_ext(
            spr_chatbox,
            0,
            230,
            95,
            0.75,
            0.75,
            0,
            c_white,
            1
        );
    }
}