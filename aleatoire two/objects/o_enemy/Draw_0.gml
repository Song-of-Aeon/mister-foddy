draw_set_color(c_red);
draw_rectangle(x-8, y-14, x-8+hp/maxhp*16, y-12, false);
//log(sprite_index);
//log(s_point);
draw();
exit;

if(is_method(draw))
	draw()
else
	method(self,draw)();
