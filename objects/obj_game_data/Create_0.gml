//Array Nyimpan Bintang (Khusus Graph)
//Index 0 = Easy, Index 1 = Medium, Index 2 - Hard
global.graph_sub_stars = [
	[0,0,0], //index 0 = Easy
	[0,0,0], //index 1 = Medium
	[0,0,0] // index 2 = Hard
];

//Varibel penanda tingkat kesulitan yang dimainkan
global.current_difficulty = 0;

//varibel penanda sub level. 
global.current_sub_stage = 0;

//pengecekan diff completed inisiasi
global.diff_completed = [false, false, false];

//untuk mengarahkan ke sub level
global.target_menu_stage = 0;