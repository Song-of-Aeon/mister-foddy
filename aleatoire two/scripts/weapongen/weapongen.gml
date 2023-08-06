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
		
	},
	draw: function() {
		draw_ring(mouse_x, mouse_y, 6);
	},
	ammo: 9,
	ammomax: 9,
	name: "the commander video",
	sprite: s_null,
});