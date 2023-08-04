function c_shootsprite(x, y, speed, rotation, bulletdir, sprite, xinterval, yinterval, types, size=1, behaviors=u, draw=u, flat=u, additive=false, silent=false, nameskip=false) {
	var name = sprite_get_name(sprite);
	if !variable_struct_exists(global.shotsprites, name) || nameskip {
		nu spritedesign(sprite, name);
	}
	var thesprite = global.shotsprites[$name];
	return c_shootdesign(x, y, speed, rotation, bulletdir, thesprite.design, xinterval, yinterval, types, size, thesprite.xorigin, thesprite.yorigin, thesprite.colors, behaviors, draw, flat, additive, silent);
}

global.shotsprites = {};

function spritedesign(sprite_, name_=u, return_=false) constructor {
	if name_ == u {
		name_ = sprite_get_name(sprite_);
	}
	name = name_;
	sprite = sprite_;
	var i, j, mycol;
	log(sprite);
	var grabsurf = surface_create(sprite_get_width(sprite), sprite_get_height(sprite));
	design = [];
	colors = [];
	xorigin = 0
	yorigin = sprite_get_yoffset(sprite)/2;
	surface_set_target(grabsurf);
	draw_sprite(sprite, 0, sprite_get_xoffset(sprite), sprite_get_yoffset(sprite));
	for (i=0; i<sprite_get_height(sprite); i++) {
		for (j=0; j<sprite_get_width(sprite); j++) {
			mycol = surface_getpixel(grabsurf, j, i);
			if !array_contains(colors, mycol) { //top left color will be transparent
				array_push(colors, mycol);
			}
			design[i][j] = array_find_index(colors, mycol);
		}
	}
	array_delete(colors, 0, 1);
	surface_reset_target();
	if !return_ {
		global.shotsprites[$name] = self;
	}
}

#macro surface_get_pixel surface_getpixel
#macro surface_get_pixel_ext surface_getpixel_ext