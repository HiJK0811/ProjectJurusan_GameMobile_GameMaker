/// @function src_generate_customer()
function src_generate_customer(){
	// ================= NPC =================
npc_x = -200;
npc_y = 120;

npc_arrived = false;
npc_name =
    npc_names[
        irandom(array_length(npc_names)-1)
    ];

npc_color =
    npc_colors[
        irandom(array_length(npc_colors)-1)
    ];

// ================= REQUIREMENT =================

repeat(20)
{
    requirement =
    choose(
        "MINUMAN_TERMURAH",
        "MINUMAN_TERMAHAL",
        "CEMILAN_TERMURAH",
        "CEMILAN_TERMAHAL",
        "MAKANAN_TERMURAH",
        "MAKANAN_TERMAHAL"
    );

    if(requirement != old_requirement)
    {
        break;
    }
}

// ================= REQUIREMENT TEXT =================

switch(requirement)
{
    case "MINUMAN_TERMURAH":

        req_text = "Cari Minuman Termurah";

        dialog_req =
        choose(
            "Ada minuman murah tidak?",
            "Lagi hemat nih, minuman termurah apa ya?",
            "Budgetku tipis hari ini.",
            "Kasih minuman yang paling murah dong.",
            "Aku cuma punya uang sedikit."
        );

    break;

    case "MINUMAN_TERMAHAL":

        req_text = "Cari Minuman Termahal";

        dialog_req =
        choose(
            "Kasih aku minuman premium.",
            "Aku mau minuman terbaik yang ada.",
            "Yang paling mahal disini apa?",
            "Hari ini aku lagi mau traktir diri sendiri.",
            "Cari minuman yang paling berkelas dong."
        );

    break;

    case "CEMILAN_TERMURAH":

        req_text = "Cari Cemilan Termurah";

        dialog_req =
        choose(
            "Ada cemilan murah?",
            "Aku cuma mau ngemil ringan.",
            "Budget cemilanku pas-pasan nih.",
            "Kasih cemilan yang paling murah ya.",
            "Aku lagi hemat hari ini."
        );

    break;

    case "CEMILAN_TERMAHAL":

        req_text = "Cari Cemilan Termahal";

        dialog_req =
        choose(
            "Aku mau cemilan terbaik yang ada.",
            "Kasih cemilan premium dong.",
            "Yang paling mahal disini apa?",
            "Hari ini aku mau memanjakan diri.",
            "Cari cemilan yang spesial ya."
        );

    break;

    case "MAKANAN_TERMURAH":

        req_text = "Cari Makanan Termurah";

        dialog_req =
        choose(
            "Belum gajian nih.",
            "Kasih makanan yang murah saja.",
            "Budget makanku terbatas hari ini.",
            "Ada makanan hemat tidak?",
            "Yang penting kenyang dan murah."
        );

    break;

    case "MAKANAN_TERMAHAL":

        req_text = "Cari Makanan Termahal";

        dialog_req =
        choose(
            "Kasih aku makanan premium.",
            "Aku mau makanan terbaik hari ini.",
            "Yang paling mahal disini apa?",
            "Hari ini aku lagi ingin makan enak.",
            "Tolong rekomendasikan makanan paling mewah."
        );

    break;
}

// ================= RESET MINIGAME =================

selected_index = -1;

drag_index = -1;
hover_index = -1;
hover_menu = -1;

is_dragging = false;

search_result = "";
result_message = "";

can_search = false;
can_submit = false;

used_winrate = false;

success = false;

correct_answer = "";

// ================= RESET TIMER =================

time_limit = 30;
time_left = time_limit * room_speed;

time_up = false;

// ================= RESET NPC =================

repeat(20)
{
    npc_name =
        npc_names[
            irandom(array_length(npc_names)-1)
        ];

    if(npc_name != old_npc_name)
    {
        break;
    }
}

repeat(20)
{
    npc_color =
        npc_colors[
            irandom(array_length(npc_colors)-1)
        ];

    if(npc_color != old_npc_color)
    {
        break;
    }
}
old_npc_name = npc_name;
old_npc_color = npc_color;
old_requirement = requirement;
// ================= RANDOM MENU =================

for(var i=0;i<50;i++)
{
    var a =
        irandom(array_length(menu_data)-1);

    var b =
        irandom(array_length(menu_data)-1);

    var temp =
        menu_data[a];

    menu_data[a] =
        menu_data[b];

    menu_data[b] =
        temp;
}
}
