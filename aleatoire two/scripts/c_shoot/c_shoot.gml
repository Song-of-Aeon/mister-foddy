//c_shoot_ext()
//c_shext();
/// @desc shoots a bullet, baby
/// @param {real} x x
/// @param {real} y y
/// @param {real} speed px/frame
/// @param {real} direction degrees
/// @param {struct} type archetype
/// @param {constant.color} [color] color
/// @param {function} [behavior] step
/// @param {function} [draw_] u=archetype inherit
/// @param {bool} [additive] use bm_add
/// @param {bool} [silent] disable sound and spawn effect
/// @returns {id.Instance} instance id
	function c_shoot(x, y, speed, direction, type, color=c_white,  behavior=c_null, draw_=u, additive=false, silent=false) {
	var chump;
	if(!BROWSER) //if we aint a bowser...
		chump = instance_create_layer(x, y, layer_get_id(!additive ? "bullets" : "bullets_add"), o_bullet); //no more
	else
		chump = Stullet(x,y);
	
	throw("\nWINDOWS IS DEAD\nTHREADS ARE FUEL\nBUFFER IS FULL");
	
	//GO TO JSREPLACEMENTS
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	chump.spd = speed;
	chump.dir = direction
	chump.type = type;
	chump.color = color;
	chump.additive = additive;
	
	with chump {
		sprite_index = type.sprite;
		_sprite_width = sprite_width;
		_sprite_height = sprite_height;
		if(BROWSER) //code to set up bbox vars used in collision checks.
			setUpBBOX(self)
		friendly = type.friendly;
		zfriendly = friendly;
		damage = type.damage;
		destructible = type.destructible;
		alpha = type.alpha;
		rotate = type.rotate;
		onhit = method(global.me, type.onhit);
		if type.colorable {
			colorcover = asset_get_index(string(sprite_get_name(sprite_index)) + "cc");
		} else {
			colorcover = s_null;
		}
		particling = type == bul.particle;
		if friendly {
			damage *= ISAAC.damage;
			fxscale = 1;
		}
		image_angle = direction-90;
	}
	chump.normalDraw = false;
	if draw_ == u {
		if type.draw == c_bulletdraw && additive {
			chump.normalDraw = true; //this means stullets handle the construction of the vbuffer
			chump.draw = c_flatcolor;
		} else {
			chump.normalDraw = true;
			chump.draw = munction(type.draw);
		}
	} else {
		if(draw_ == c_bulletdraw){
			chump.normalDraw = true;	
		}
		chump.draw = munction(draw_);
	}
	//event_typele
	if silent == 1 {
		chump.acount = chump.alpha;
	} else if !global.ssounds[type.sound] {
		chump.gravity_direction = se_play(type.sound, u, .5, .3 );
		global.ssounds[type.sound] += 8;
	}
	if behavior == c_null {
		chump.simple = true;
	} else {
		chump.simple = false;
		chump.behaviors = munction(behavior);
	}
	chump.directioning = true;
	chump.originx = x;
	chump.originy = y;
	chump.owner = self;
	
	return chump;
}

function c_shootcircle(x, y, speed, origindirection, density, bullettype, color=c_white, behavior=c_null, draw=u, additive=false, distance=0, silent=false, spddeviation=0) {
	var i;
	var bulletcount = 0;
	var bullets = [];
	
	for (i=0; i<360; i+=360/density) {
		var distguy = distabs(origindirection+i, distance);
		var chump = c_shoot(x+distguy.x, y+distguy.y, speed, origindirection+i, bullettype, color, behavior, draw, additive, silent);
		chump.directioning = true;
		bullets[bulletcount] = chump;
		bulletcount++;
	}
	global.lololol = spddeviation;
	with_array(bullets, function() {spd += seed.float(global.lololol*2)-global.lololol});
	return bullets;
}

function c_lasecircle(x, y, speed, length, width, origindirection, density, archetype, color=c_white, behavior=c_null, draw=u, additive=false, distance=0, silent=false, spddeviation=0) {
	var i;
	var bulletcount = 0;
	var bullets = [];
	
	for (i=0; i<360; i+=360/density) {
		var distguy = distabs(origindirection+i, distance);
		var chump = c_lase(x+distguy.x, y+distguy.y, speed, origindirection+i, length, width, archetype, color, behavior, draw, additive, silent);
		chump.directioning = true;
		bullets[bulletcount] = chump;
		bulletcount++;
	}
	global.lololol = spddeviation;
	with_array(bullets, function() {spd += seed.float(global.lololol*2)-global.lololol});
	return bullets;
}

function c_shootfan(x, y, speed, startdirection, enddirection, amount, offsetamount, bullettype, color=c_white, behavior=NUMBER5, draw=u, additive=false, silent=false) {
	var i;
	var bulletcount = 0;
	var bullets = [];
	//offsetamount = speed;
	//var maxbulletcount = abs(startdirection-enddirection);
	var iterations = 0;
	for (i=0; i<amount; i++) {
		var theDir = lerp(startdirection,enddirection,i/amount);
		var fartin = (i/amount)*offsetamount;
		//log(theDir, fartin);
		//og(startdirection, i/amount, i, amount);
		
		var chump = c_shoot(x-dcos(theDir)*fartin, y+dsin(theDir)*fartin, speed, theDir, bullettype, color, behavior, draw, additive, silent);
		//log(chump.dir);
		chump.directioning = true;
		
		bullets[bulletcount] = chump;
		bulletcount++;
		iterations++;
	}
	return bullets;
}

/*var _bullet = {}
with(_bullet){
	giveGameObjectVariables()
}
global.dummyBullet = _bullet;*/