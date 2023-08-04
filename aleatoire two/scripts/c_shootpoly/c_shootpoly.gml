function c_shootpoly(x, y, speed, rotation, direction, sides, diameter, density, explodes, type, color=c_white, behavior=c_null, draw_=u, additive=false, silent=false) {
	if !sides {
		return c_shootcircle(x, y, speed, direction, density, type, color, behavior, draw_, additive, silent);
	}
	var boul;
	var dudes = [];
	var xs = [];
	var ys = [];
	if sides == 1 {
		var dist = diameter/density;
		var i;
		for (i=floor(-density/2); i<floor(density/2)+1; i++) {
			var dude = distabs(rotation, i*dist);
			boul = c_shoot(x+dude.x, y+dude.y, speed, direction, type, color, behavior, draw_, additive, silent);
			array_push(dudes, boul);
		}
		return dudes;
	}
	var i;
	var myit = 0;
	for (i=rotation; i<=rotation+360; i+=360/sides) {
		var dude = distabs(i, diameter/2);
		xs[myit] = x+dude.x;
		ys[myit] = y+dude.y;
		myit++;
	}
	dudes = c_shootlines(xs, ys, speed, direction, ceil(density/sides), type, color, behavior, draw_, additive, silent);
	if explodes {
		var spdmult = point_distance(x, y, xs[0], ys[0]);
		for (i=0; i<array_length(dudes); i++) {
			dudes[i].dir = point_direction(x, y, dudes[i].x, dudes[i].y);
			dudes[i].spd *= point_distance(x, y, dudes[i].x, dudes[i].y)/spdmult;
		}
	}
	return dudes;
}

function c_shootline(x1, y1, x2, y2, speed, direction, density, type, color=c_white, behavior=c_null, draw_=u, additive=false, silent=false) {
	var i;
	var xdist = x2-x1;
	var ydist = y2-y1;
	var boul;
	var dudes = [];
	for (i=0; i<density; i++) {
		boul = c_shoot(x1+xdist*(i/density), y1+ydist*(i/density), speed, direction, type, color, behavior, draw_, additive, silent);
		array_push(dudes, boul);
	}
	return dudes;
}

function c_shootlines(xs, ys, speed, direction, density, type, color=c_white, behavior=c_null, draw_=u, additive=false, silent=false) {
	var dudes = [];
	var i;
	for (i=1; i<array_length(xs); i++) {
		var bouls = c_shootline(xs[i-1], ys[i-1], xs[i], ys[i], speed, direction, density, type, color, behavior, draw_, additive, silent);
		array_append(dudes, bouls);
	}
	return dudes;
}