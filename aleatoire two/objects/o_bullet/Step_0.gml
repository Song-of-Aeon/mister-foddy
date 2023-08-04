direction = dir;
speed = spd*global.timescale;
repeat(getticks()){
	acount = min(acount+.04, alpha);
	image_alpha = acount;
	fxscale = image_xscale*((alpha-acount)*4+1);
	if !simple behaviors();
	//if image_alpha != acount acount -= (image_alpha-acount);
	dir += tspd;
	//var xold = x;
	//var yold = y;
	x += hspd;
	y += vspd;
	//var time = get_timer();
	//image_angle = point_direction(xprevious, yprevious, x, y)-90;
	//log(image_angle);
	if !((real(id)+gc)%60) {
		if !(x==clamp(x, -escapedistance, 290+escapedistance) && y==clamp(y, -escapedistance, 340+escapedistance)) {
			instance_destroy();
		}
	}
	//image_angle = point_direction(xold, yold, x, y)-90;
	//image_angle = point_direction(xprevious, yprevious, x, y)-90;
	//log(get_timer()-time);

	//image_alpha = clamp(image_alpha+((abs(hspd)+abs(vspd))/2+speed+.05)/10, 0, alpha);
	
}
