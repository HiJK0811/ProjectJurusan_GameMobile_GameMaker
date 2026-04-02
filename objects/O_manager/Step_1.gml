if (global.ctsType != -1 && global.ctspost >= 0) {

    if (is_array(global.ctsAnims[global.ctsType])) {

        if (global.ctspost < array_length(global.ctsAnims[global.ctsType])) {

            var anim = global.ctsAnims[global.ctsType][global.ctspost];

            var actor = anim[0];
            var type  = anim[1];
            var data  = anim[2];

            switch(type){

                case atype.move:

                    var dist = data[0];
                    var dir  = data[1];

                    actor.spd = actor.movement_speed;
                    actor.dir = dir;

                    actor.moveddist += actor.spd;

                    if(actor.moveddist >= dist){
                        global.ctspost++;
                        actor.spd = 0;
                        actor.moveddist = 0;
                    }

                break;

                case atype.talk:
                break;
            }

        }

    }

}