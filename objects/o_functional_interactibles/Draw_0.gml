draw_self();

if(can_interact && !instance_exists(o_functional_dialogue)){
	draw_sprite(spr_interactible, 0, x, y - 32);
}