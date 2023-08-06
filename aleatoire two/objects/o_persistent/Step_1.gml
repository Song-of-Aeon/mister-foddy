gc++;
c_inputupdate();
if instance_exists(DEFINE) && instance_exists(o_theenemy) {
	if df.state != st_ship {
		x = lerp(x, df.x, .2);
		y = lerp(y, df.y, .2);
	} else {
		x = lerp(x, lerp(df.x, o_theenemy.x, .3), .2);
		y = lerp(y, lerp(df.y, o_theenemy.y, .3), .2);
	}
}