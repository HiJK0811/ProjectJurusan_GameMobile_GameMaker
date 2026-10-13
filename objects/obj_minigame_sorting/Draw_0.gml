
// ================= DRAW EVENT =================

switch(state)
{
    case ORDER_STATE.ARRIVAL:
	
	if(show_npc)
{
    src_draw_npc();
}


        draw_set_color(c_white);

        draw_text(
            280,
            230,
            "Klik untuk mulai melayani"
        );

    break;

    case ORDER_STATE.MINIGAME:
	if(show_npc)
{
    src_draw_npc();
}

        

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
		show_menu = false;

		src_draw_npc();

    break;

   /* case ORDER_STATE.STAGE_RESULT:
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
if (!is_array(customer_log))
{
    customer_log = [];
}
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

    break;*/
}
