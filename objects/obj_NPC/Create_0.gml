// Inherit the parent event
event_inherited();

behavior = "wander";
home_x = x;
home_y = y;
wander_range = 5 * 5;

wander_min_time = 60 * 1;
wander_max_time = 60 * 3;

wander_timer = irandom_range(wander_min_time, wander_max_time)

min_distance_to_player = 0;
input_key = vk_space;
input_alt = vk_enter;
can_interact = false;

text_id = ""

// == Cutscene ==
// Cutscene 1
post_cutscene_check = ""; // The ID of the cutscene this NPC is waiting for
post_cutscene_text_id = ""; // The text to show after that cutscene is done

// Cutscene 2
post_cutscene_check_2 = "";
post_cutscene_text_id_2 = "";

// Cutscene 3
post_cutscene_check_3 = "";
post_cutscene_text_id_3 = "";

// add more if necessary

// == Minigame ==
post_logic_text_id = ""; // NEW: Variable for dialogue after the minigame
post_hanoi_text_id = ""; // NEW: Variable for dialogue after Tower of Hanoi