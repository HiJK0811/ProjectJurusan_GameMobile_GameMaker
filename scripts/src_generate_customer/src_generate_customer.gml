/// @function src_generate_customer()
function src_generate_customer(){
	
//==================================================
// RANDOM NPC
//==================================================
show_menu = false;
// Gender
repeat(20)
{
    var g = choose("Male","Female");

    if(g != old_npc_gender)
    {
        npc_gender = g;
        break;
    }
}

old_npc_gender = npc_gender;


// Variant Sprite
repeat(20)
{
    var v;

    if(npc_gender == "Male")
        v = irandom(array_length(male_walk)-1);
    else
        v = irandom(array_length(female_walk)-1);

    if(v != old_npc_variant)
    {
        npc_variant = v;
        break;
    }
}

old_npc_variant = npc_variant;


// Nama
if(npc_gender == "Male")
{
    npc_name =
male_names[
    irandom(array_length(male_names)-1)
];

   

    current_walk1    = male_walk[npc_variant];
    current_idle     = male_idle[npc_variant];
	current_stay     = male_portrait[npc_variant];
    current_portrait = male_portrait[npc_variant];
}
else
{
    npc_name =
female_names[
    irandom(array_length(female_names)-1)
];

    

    current_walk1    = female_walk[npc_variant];
    current_idle     = female_idle[npc_variant];
	current_stay = female_portrait[npc_variant];
    current_portrait = female_portrait[npc_variant];
}
// Warna nama
repeat(20)
{
    npc_color =
    npc_colors[
        irandom(array_length(npc_colors)-1)
    ];

    if(npc_color != old_npc_color)
        break;
}

old_npc_color = npc_color;


// Posisi NPC
npc_x = npc_start_x;
npc_y = npc_start_y;
npc_arrived = false;
npc_walk_frame = 0;
npc_walk_timer = 0;
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
// ================= GENERATE MENU =================

src_generate_menu();

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
old_requirement = requirement;
has_player_sorted = false;
can_search = false;

// ================= RESET NPC =================

/*repeat(20)
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
}*/



/*npc_name = npc_names[old_npc_name_index];
old_npc_name = npc_name;
old_npc_color = npc_color;
old_requirement = requirement;
has_player_sorted = false;
can_search = false;*/
/*// ================= RANDOM MENU =================

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
}*/
/*current_walk1 =
npc_walk1[npc_index];

//current_walk2 =
//npc_walk2[npc_index];

current_idle =
npc_idle[npc_index];

current_portrait =
npc_portrait[npc_index];*/

}
