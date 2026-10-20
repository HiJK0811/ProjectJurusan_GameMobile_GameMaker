function src_draw_npc()
{
    //---------------------------------------
    // WORLD NPC
    //---------------------------------------

    var spr;

    if (npc_arrived)
        spr = current_stay;
    else
        spr = (npc_walk_frame == 0) ? current_walk1 : current_idle;

    draw_sprite_ext(
        spr,
        0,
        npc_x,
        npc_y,
        npc_scale,
        npc_scale,
        0,
        c_white,
        1
    );

    //---------------------------------------
    // CHAT BUBBLE
    //---------------------------------------
	
if(state == ORDER_STATE.MINIGAME){
	
    if (state != ORDER_STATE.LEAVE)
    {
        draw_sprite_ext(
    spr_chatbox,
    0,
    200,
    25,
    3,
    3,
    0,
    c_white,
    1
);
    }

    draw_set_alpha(1);
    draw_set_color(c_white);
}
}