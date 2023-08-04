/// @desc Function Description
/// @param {any} name_ Description
/// @param {asset.gmsprite} [sprite_]=s_mistake Description
/// @param {real} [damage_]=1 normal for enemies is 3 normal for players is 1
/// @param {bool} [destructible_]=true breaks upon impact or when player tries to destroy bullets
/// @param {bool} [friendly_]=false friendly=NaN means it hits nobody
/// @param {real} [alpha_]=1 Description
/// @param {function} [draw_]=c_bulletdraw Description
/// @param {bool} [rotate_]=true should the sprite rotate in accordance with its direction
/// @param {asset.gmsound} [sound_]=snd_shoot Description
/// @param {function} [onhit_]=st_hurt Description
function bullet(name_, sprite_=s_bulmistake, damage_=1, destructible_=true, friendly_=false, alpha_=1, draw_=c_bulletdraw, rotate_=true, sound_=friendly_ ? se_null : se_shootsmall, onhit_=st_hurt) constructor {
	if friendly_ && sound_ == se_shootbig {
		sound_ = se_null;
	}
	sprite = sprite_;
	colorable = asset_get_index(string(sprite_get_name(sprite_)) + "cc");
	damage = damage_;
	destructible = destructible_;
	friendly = friendly_;
	alpha = alpha_;
	//draw = rotate ? function_append(dospin, draw_) : draw_;
	draw = munction(draw_);
	rotate = rotate_;
	sound = sound_;
	onhit = onhit_;
	variable_struct_set(global.bullets, name_, self);
}

function hitscan(name_, sprite_=s_mistake, damage_=1, destructible_=true, friendly_=false, alpha_=1, draw_=c_bulletdraw, sound_=se_shootbig, onhit_=st_hurt) constructor {
	sprite = sprite_;
	colorable = asset_get_index(string(sprite_get_name(sprite_)) + "cc");
	damage = damage_;
	destructible = destructible_;
	friendly = friendly_;
	alpha = alpha_;
	draw = munction(draw_);
	sound = sound_;
	onhit = onhit_;
	variable_struct_set(global.hitscans, name_, self);
}

function laser(name_, sprite_=s_mistake, damage_=1, destructible_=true, friendly_=false, alpha_=1, draw_=c_bulletdraw, sound_=se_shootbig, onhit_=st_hurt) constructor {
	sprite = sprite_;
	colorable = asset_get_index(string(sprite_get_name(sprite_)) + "cc");
	damage = damage_;
	destructible = destructible_;
	friendly = friendly_;
	alpha = alpha_;
	//draw = rotate ? function_append(dospin, draw_) : draw_;
	draw = munction(draw_);
	sound = sound_;
	onhit = onhit_;
	variable_struct_set(global.lasers, name_, self);
}