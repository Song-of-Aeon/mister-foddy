z = 0;
scale = 1;
dir = 0;
image_angle = dir - 90;
spd = 0;
tspd = 0; //turnspeed
hspd = 0;
vspd = 0;
dspd = 0;
acc = 0;
count = 0;
behaviors = c_null;
//draw = c_bulletdraw;
rotate = true;
additive = false;
type = global.bullets.clearer;
grazed = false;
image_alpha = .4;
acount = .4;
alpha = 0;
didit = false;
created = false;
//show_debug_overlay(true);
//depth = 10;
simple = false;
fxscale = image_xscale*((alpha-image_alpha)*4+1);
iterations = 0;
intangible = false;
despawn = c_null;
escapedistance = 50;
designed = false;
addvspd = 0;
color = c_white;

//event_perform_object(self,ev_step,0);

image_angle = point_direction(xprevious, yprevious, x, y)-90;

getticks = c_getticks;


ontouch = c_null;
onstay = c_null;
onleave = c_null;