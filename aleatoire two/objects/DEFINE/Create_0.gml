c_input();
count = 0;

spd = {
	h: 0,
	v: 0,
	d: 0,
}
espd = {
	h: 0,
	v: 0,
	d: 0,
}
defense = 0;
//log(global.weapons)

cameratarg = new vec2();
cameradelay = 0;

accel = .1;
frict = .1;
airaccel = .1;
airfrict = .1;
walkspeed = 1.9;
jumpspeed = 3.75;
grav = .1;
leniance = 0;
lencount = 10;
magazines = 1;
maxmagazines = 1;
aerial = false;
altpos = 0;
hp = 10;
maxhp = 100;
dir = 0;
inv = 0;

eqwp = 0;
altpos = 0;


sprites = {
	idle: s_when_im,
	walk: s_when_im,
	up: s_when_im,
	upwalk: s_when_im,
	down: s_when_im,
	jump: s_when_im,
}
/*sprites = {
	idle: s_kyblock,
	walk: s_kyblock,
	up: s_kyblock,
	upwalk: s_kyblock,
	down: s_kyblock,
	jump: s_kyblock,
}*/
sprite_index = s_when_im;
weapons = [
	[wp[$"the commander video"]],
];
ppos = 0;
pdist = 0;
//points = [new vec2(100, 40), new vec2(200, 60), new vec2(250, 20)];
points = global.points;
grav = .16;
leniance = 12;
accel = .1;
airaccel = .04;
frict = .14;
airfrict = .01;
walkspeed = 2.1;
jumpspeed = 4;
state = st_ship;
drawstate = st_shipdraw;
faceangle = 0;
spriteindex = 0;
imageindex = 0;
//actionstate = st_7
touchers = [];
xdraw = -100;
ydraw = 310;
global.count = 0;
global.me = id;
#macro df global.me
//instance_create(0, 0, o_mapmanager);

//lilystats
/*

*/

camera_set_view_target(view_camera[0], o_persistent);
camera_set_view_border(view_camera[0], MIDWID, MIDHEI);