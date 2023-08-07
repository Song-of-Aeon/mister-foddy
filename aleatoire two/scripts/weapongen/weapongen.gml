function weapongen(weapon) {
	global.weapons[$weapon.name] = weapon;
}

global.weapons = {};
#macro wp global.weapons

weapongen({
	step: function(input) {
		if input.hit {
			var dude = new vec2(mouse_x, mouse_y);
			dude.x += o_persistent.x;
			dude.y += o_persistent.y;
			dude.x -= 512/2;
			dude.y -= 288/2;
			target = collision_circle(dude.x, dude.y, 6, o_bullet, false, false);
		}
		if input.hold && target && point_direction(df.x, df.y, target.x, target.y) < 400 {
			var dude = distabs(point_direction(df.x, df.y, target.x, target.y), 1);
			df.spd.h = lerp(df.spd.h, dude.x*9, .05);
			df.spd.v = lerp(df.spd.v, dude.y*9, .05);
			df.aerial = true;
		}
		if !instance_exists(target) target = noone;
		if target && (input.drop || point_distance(df.x, df.y, target.x, target.y) > 400) {
			target = noone;
		}
	},
	draw: function() {
		draw_ring(mouse_x, mouse_y, 3);
		if target {
			draw_ring(target.x, target.y, 3);
			draw_line(df.x, df.y, target.x, target.y);
		}
	},
	ammo: 9,
	ammomax: 9,
	name: "pearl",
	sprite: s_null,
	target: noone,
});

weapongen({
	step: function(input) {
		if input.hit && ammo >= ammomax {
			var dude = new vec2(window_view_mouse_get_x(view_camera[0]), window_view_mouse_get_y(view_camera[0]));
			log(dude);
			var dude = new vec2(window_mouse_get_x(), window_mouse_get_y());
			log(dude);
			var dude = new vec2(display_mouse_get_x(), display_mouse_get_y());
			log(dude);
			var dude = new vec2(mouse_x, mouse_y);
			log(dude);
			dude.x += o_persistent.x;
			dude.y += o_persistent.y;
			dude.x -= 512/2;
			dude.y -= 288/2;
			log(dude);
			var boul = c_shoot(df.x, df.y, 5, point_direction(df.x, df.y, dude.x, dude.y), bul.clearer, u, function() {
				var dude = collision_circle(x, y, sprite_width*image_xscale, o_bullet, true, true);
				if dude && dude.friendly == false {
					c_clearradius(x, y, 32, u, true);
				}
			});
			tag("myshots", boul);
		}
	},
	draw: function() {
		draw_ring(mouse_x, mouse_y, 6);
	},
	ammo: 9,
	ammomax: 9,
	name: "the commander video",
	sprite: s_null,
});

nu bullet("clearer", s_bullet, 0, false, true, 1);