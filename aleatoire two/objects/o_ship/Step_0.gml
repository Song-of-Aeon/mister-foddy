pdist -= .5;
	
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
	}
}