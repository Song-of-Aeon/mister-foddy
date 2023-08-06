function weapongen(weapon) {
	global.weapons[$weapon.name] = weapon;
}

global.weapons = {};
#macro wp global.weapons

weapongen({
	step: function(input) {
		
	},
	draw: function() {
		draw_ring(mouse_x, mouse_y, 3);
	},
	ammo: 9,
	ammomax: 9,
	name: "pearl",
	sprite: s_null,
});

weapongen({
	step: function(input) {
		if input.hit && array_length(tag_get_instances("myshots")) < 999 {
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
					instance_destroy(dude);
					rescale(self, scale*.7);
					if scale < .2 kys;
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

nu bullet("clearer", s_when_the, 0, false, true, 1);