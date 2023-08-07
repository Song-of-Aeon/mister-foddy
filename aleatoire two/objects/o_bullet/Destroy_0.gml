/// @description Insert description here
// You can write your code in this editor
/*repeat(20){
	instance_create(x,y,o_particle);
}*/

munction(despawn)();
if false && !is_oob() && alpha > .1 && type != bul.particle {
	var guy = Particle(x, y, function() {
		//log(self);
		if friendly {
			draw_set_color(c_cyan);
		} else {
			draw_set_color(c_red);
		}
		draw_set_alpha(.8);
		draw_ring(x, y, size, false);
		size *= 0.9;
		size -= 0.1;
		if !size {
			die();
		}
	});

	guy.size = damage*2+2;
	guy.friendly = friendly;
	
	if friendly {
		var dude = scriptable_create(u, function() {
			draw_self();
			image_xscale += .2;
			image_yscale += .2;
			image_alpha -= .1;
			x += hspd;
			y += vspd;
			hspd *= .85;
			vspd *= .85;
			speed *= .85;
			if !image_alpha instance_destroy();
		}, layer);
		dude.x = x;
		dude.y = y;
		dude.speed = spd;
		dude.direction = dir;
		dude.hspd = hspd;
		dude.vspd = vspd;
		dude.sprite_index = sprite_index;
		dude.image_index = image_index;
		dude.image_xscale = image_xscale;
		dude.image_yscale = image_yscale;
		dude.image_angle = image_angle;
		dude.image_alpha = image_alpha;
	} else {
		c_finditem(ITEMS._SCORE).thescore += .1;
		exit;
		var guy = scriptable_create(function(){
				c;
				switch(global.destroyshape){
					case DESTROYSHAPE.CIRCLE:
						var xComponent = abs(x-(global.gw/2));
						var yComponent = abs(y-(global.gh/2));
						//if(
					break;
				}
		})
	}
	
	//instance_change()?????????????
}