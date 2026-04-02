///@description
//variable
global.ctspost =-1;
global.ctsType= -1;

global.ctsAnims = [];

//cutscene
enum cts{
	test,
	talkbox
}
//action
enum atype{
	move,
	talk
}
function startCutscene(_type) {
    global.ctsType = _type;
    global.ctspost = 0;
}
///cutscene test 1
var player = instance_find(obj_player, 0);
var npc = instance_find(obj_npc1,0);

addAnims(cts.test, npc, atype.move, [75,0], "");
addAnims(cts.test, npc, atype.move, [75,90], "");
addAnims(cts.test, npc, atype.move, [75,180], "");
addAnims(cts.test, npc, atype.move, [90,280], "");


startCutscene(cts.test);