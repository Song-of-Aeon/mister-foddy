function c_eat_shit_asshole_fall_off_your_ship(boul) {
	df.state = st_falling;
	var dude = distabs(boul.dir+180, boul.spd);
	df.weapons[0][0] = wp.pearl;
	df.spd.h = dude.x;
	df.spd.v = dude.y;
	var chump = instance_create(df.x, df.y, o_ship);
	chump.points = df.points;
	chump.ppos = df.ppos;
	chump.pdist = df.pdist;
}

function c_boardship() {
	df.state = st_ship;
	df.ppos = o_ship.ppos;
	df.pdist = o_ship.pdist;
	df.weapons[0][0] = wp[$"the commander video"];
	df.x = o_ship.x;
	df.y = o_ship.y;
	instance_destroy(o_ship);
}