function st_hurt() {
	var returnable = false;
	var isenemy = ow.friendly == true;
	//log(isenemy, damage);
	if !inv && !get_value(ow, "delay") {
		takingdamage = ow.damage;
		if takingdamage > hp && !isenemy {
			se_play(array_random([se_hurt, se_hurtwo]));
			state = st_deathbomb;
			takingtype = ow.type;
		} else {
			if isenemy {
				if !c_dohook(hooks.onenemyhit, [id, ow]) {
					takingdamage = ow.damage-defense;
					if armor {
						takingdamage /= 10;
					}
					STATS.damagedealt += takingdamage;
					if c_doenemyhook("onhit", self) exit;
					hp -= takingdamage;
				}
			} wlaw if !c_dohook(hooks.onhit, [id, ow]) {
				var osdhufji = max(takingdamage-defense, 1);
				STATS.damagetaken += osdhufji;
				se_play(se_hurt, u, .8, .2);
				hp -= osdhufji;
				//with o_boss capturing = false; //the correct way
				if instance_exists(o_boss) o_boss.capturing = false; //the baby way
				c_inv(invtime);
				c_screenshake(osdhufji, inv/2);
				ISAAC.direction = ow.image_angle+90;
				ISAAC.speed = ow.damage;
			}
		}
		returnable = true;
	}
	if ow.destructible && !get_value(ow, "delay") {
		instance_destroy(ow);
	}
	return returnable;
}
#macro wlaw else