function st_ship() {
	//log(jump);
	//log(weapons[eqwp]);
	weapons[0][0].step(attack, alt);
	
	accel = .1;
	
	if reload.hit {
		c_eat_shit_asshole_fall_off_your_ship({spd: 5, dir: 325});
	}
	
	if left.hold dir = 180;
	if right.hold dir = 0;
	if down.hold dir = 270;
	if up.hold dir = 90;
	
	
    hput = right.hold-left.hold;
    vput = down.hold-up.hold;
	
	//c_dospritesky();
	
	var thespeed = 4;
	if shift.hold thespeed /= 2;
	
	if hput != 0 {
		spd.h = lerp(spd.h, hput*thespeed, .2);
	} else {
		spd.h = lerp(spd.h, hput*thespeed, .1);
	}
	
	
	
	pdist += spd.h;
	
	if pdist < 0 {
		if ppos {
			ppos--;
			pdist = point_distance(points[ppos].x, points[ppos].y, points[ppos+1].x, points[ppos+1].y);
		} else {
			pdist = 0;
			spd.h = 0;
		}
	}
	
	var targ = points[ppos+1];
	var org = points[ppos];
	
	/*if pdist >= 0 {
		var targ = points[ppos+1]
		var org = points[ppos];
		pdist += spd.h;
	} else {
		var targ = points[ppos-1]
		var org = points[ppos];
		pdist -= spd.h;
	}*/
	var pdir = point_direction(org.x, org.y, targ.x, targ.y);
	var dude = distabs(pdir, pdist);
	x = points[ppos].x+dude.x;
	y = points[ppos].y+dude.y;
	
	if pdist > point_distance(org.x, org.y, targ.x, targ.y) {
		if ppos < array_length(points)-2 {
			pdist = 0;
			ppos++;
		} else {
			pdist = point_distance(org.x, org.y, targ.x, targ.y);
			spd.h = 0;
		}
	}
}