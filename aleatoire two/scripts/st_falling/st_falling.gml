function st_falling() {
	//log(jump);
	//log(weapons[eqwp]);
	
	if left.hold dir = 180;
	if right.hold dir = 0;
	if down.hold dir = 270;
	if up.hold dir = 90;
	
	image_angle += abs(spd.h)+abs(spd.v)
	
	
    hput = right.hold-left.hold;
    vput = down.hold-up.hold;
	
	//c_dospritesky();
	
	spd.h += hput*.02;
	
	spd.v += grav;
    //c_newcollision();
	var oldtouching = deep_copy(touchers);
	
	//var xtouching = [];
	//var ytouching = move_and_collide(spd.h, spd.v, o_solid);
	var xtouching = move_and_collide(spd.h, 0, o_solid);
	var ytouching = move_and_collide(0, spd.v, o_solid);
	
	var nottouching = ds_list_create();
	collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, o_notsolid, false, false, nottouching, false);
	nottouching = ds_list_to_array(nottouching);
	touchers = array_union(xtouching, ytouching, nottouching);
	iterate touchers to {
		touchers[i].onstay();
		if !instance_exists(touchers[i]) continue;
		if !array_contains(oldtouching, touchers[i]) touchers[i].ontouch();
	}
	iterate oldtouching to {
		if !instance_exists(oldtouching[i]) continue;
		if !array_contains(touchers, oldtouching[i]) oldtouching[i].onleave();
	}
	//log("and it");
	//log(xtouching);
	//log(ytouching);
	if array_length(ytouching) {
		leniance = lencount;
        aerial = false;
		y += -3*sign(spd.v);
		spd.v = -spd.v*.5;
		spd.h = spd.h*.7;
		
	} else {
		var stepdowndist = global.tilesize/3;
		if !aerial {
			if collision_line(x, y, x, y+sprite_get_height(sprite_index)-sprite_get_xoffset(sprite_index)+stepdowndist, o_solid, true, false) && !jump.hit {
				move_and_collide(0, stepdowndist, o_solid, u, u, u, 0, 0);
			} else aerial = true;
		}
		leniance--;
	}
	if array_length(xtouching) {
		spd.h = -spd.h*.7;
	}
	if fallcount++ > 20 && abs(spd.v) < 1 && abs(spd.h) < 1 {
		log("you got it!");
		c_clearradius(df.x, df.y, 12);
		state = st_man;
		image_angle = 0;
		y-=4;
		fallcount = 0;
	}
}