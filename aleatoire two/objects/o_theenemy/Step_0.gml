repeat(c_getticks()) {
		//log(x, y, df.x, df.y);

		pattern();

		if df.state != st_ship exit;
		if point_distance(x, y, df.x, df.y) < 240 pdist += 2 else if point_distance(x, y, df.x, df.y) > 340 {
			pdist -= 2;
		}

	
		if pdist < 0 {
			if ppos {
				ppos--;
				pdist = point_distance(points[ppos].x, points[ppos].y, points[ppos+1].x, points[ppos+1].y);
			} else {
				pdist = 0;
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
		image_angle = pdir;
		x = points[ppos].x+dude.x;
		y = points[ppos].y+dude.y;
	
		if pdist > point_distance(org.x, org.y, targ.x, targ.y) {
			if ppos < array_length(points)-2 {
				pdist = 0;
				ppos++;
			} else {
				pdist = point_distance(org.x, org.y, targ.x, targ.y);
				count -= .25;
				x += irandom(4)-2;
				y += irandom(4)-2;
			}
		}
}