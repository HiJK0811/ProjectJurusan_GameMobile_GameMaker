// Inherit the parent event
event_inherited();

behavior = "wander";
home_x = x;
home_y = y;
wander_range = 16 * 4;

wander_min_time = 60 * 0.5;
wander_max_time = 60 * 2;

wander_timer = irandom_range(wander_min_time, wander_max_time)

min_distance_to_player = 0;
input_key = vk_space;
can_interact = false;

text_id = ""