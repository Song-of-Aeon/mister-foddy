function c_eat_shit_asshole_fall_off_your_ship(boul) {
	df.state = st_falling;
	var dude = distabs(boul.dir, boul.spd*4);
	df.weapons[0][0] = wp.pearl;
	df.spd.h = dude.x;
	df.spd.v = dude.y;
	df.sprite_index = s_running;
	var chump = instance_create(df.x, df.y, o_ship);
	chump.points = df.points;
	chump.ppos = df.ppos;
	chump.pdist = df.pdist;
	c_clearradius(df.x, df.y, 32);
	global.timescale = 0;
	tag_kill("myshots");
	music_set(mus.grovular, 0);
}

function c_boardship() {
	df.state = st_ship;
	df.ppos = o_ship.ppos;
	df.pdist = o_ship.pdist;
	df.weapons[0][0] = wp[$"the commander video"];
	df.x = o_ship.x;
	df.y = o_ship.y;
	df.sprite_index = s_myship;
	df.image_xscale = 1;
	df.image_speed = 1;
	instance_destroy(o_ship);
	global.timescale = 1;
	music_set(mus.grovular, 1);
}

nu song("grovular", "grovular", [m_grovman, m_grovship], u, u, u, 18.986);