global.enemies = {};
function enemy(name_, sprite_, hp_,  step_=c_null, draw_=draw_self, create_=c_null) constructor {
	sprite = sprite_;
	hp = hp_;
	step = step_;
	draw = draw_;
	create = create_;
	name = name_;
	variable_struct_set(global.enemies, name_, self);
}

function c_spawnenemy(x, y, archetype) {
	log(archetype);
	var chump  = instance_create(x, y, o_enemy);
	chump.hp = archetype.hp;
	chump.name = archetype.name;
	chump.maxhp = archetype.hp;
	chump.sprite_index = archetype.sprite;
	if(archetype.step != undefined)
		chump.step = method(chump, archetype.step);
	if(archetype.draw != undefined)
		chump.draw = method(chump, archetype.draw);
	chump.archetype = archetype;
	c_tilequantize(chump);
	//method(chump, archetype.create)();
	return chump;
}

nu enemy("impostor", s_when_the, 100);
nu enemy("spawnpoint", s_when_im, 9999, c_spawnpointstep);

function c_spawnpointstep() {
	log("ha ha");
	if !instance_exists(DEFINE) {
		instance_create(x, y, DEFINE);
	} else {
		DEFINE.x = x;
		DEFINE.y = y;
	}
	kys;
}

//i wake up to the sound of the silence that allows
//for my mind to run around with my ear up to the ground
//searching to behold the story that was told
//as my back was to the world that was smiling as i turned

//tell you you're the greatest
//but once you turn, they hate us

//uh, oh, the misery
//everybody wants to be my enemy
//spare-me-the sympathies
//everybody wants to be
//my enemy()