function c_loadmap(map_, editing=false) {
	//log(map_);
	with all {
		if !persistent kys;
	}
	var dissolve = false;
	if !instance_exists(o_mapper) {
		instance_create(-10, -10, o_mapper);
		dissolve = true;
	}
	with o_mapper {
		guys = [];
		enemies = [];
		triggers = [];
		iterate map_.guys to { //bro just store their damn names
			
			/*if typeof(map_.guys[i].sprite) == "string" {
				map_.guys[i].sprite = asset_get_index(map_.guys[i].sprite);
			}
			if typeof(map_.guys[i].step) == "string" {
				map_.guys[i].step = script_get_index(map_.guys[i].step);
			}
			if typeof(map_.guys[i].draw) == "string" {
				map_.guys[i].draw = script_get_index(map_.guys[i].draw);
			}
			if typeof(map_.guys[i].ontouch) == "string" {
				map_.guys[i].ontouch = script_get_index(map_.guys[i].ontouch);
			}
			if typeof(map_.guys[i].onstay) == "string" {
				map_.guys[i].onstay = script_get_index(map_.guys[i].onstay);
			}
			if typeof(map_.guys[i].onleave) == "string" {
				map_.guys[i].onleave = script_get_index(map_.guys[i].onleave);
			}*/
			var newman = deep_copy(map_.guys[i]);
			var chump = c_maketile(map_.guys[i].x, map_.guys[i].y, tl[map_.guys[i].tileset][map_.guys[i].index], 0);
			
			chump.links = newman.links;
			//chump.depth = newman.depth;
			chump.thing = newman;
			array_push(guys, newman);
		}
		//log(guys);
		//log(map_.enemies);
	
		iterate map_.enemies to {
			log("enemize");
			var friend = en[$map_.enemies[i].name];
			map_.enemies[i].sprite = friend.sprite;
			map_.enemies[i].create = friend.create;
			map_.enemies[i].step = friend.step;
			map_.enemies[i].draw = friend.draw;
			/*if typeof(map_.enemies[i].sprite) == "string" {
				map_.enemies[i].sprite = asset_get_index(map_.enemies[i].sprite);
			}
			if typeof(map_.enemies[i].create) == "string" {
				log(map_.enemies[i].create, script_get_index(map_.enemies[i].create));
				map_.enemies[i].create = script_get_index(map_.enemies[i].create);
			}
			if typeof(map_.enemies[i].step) == "string" {
				log(map_.enemies[i].step, script_get_index(map_.enemies[i].step));
				map_.enemies[i].step = script_get_index(map_.enemies[i].step);
			}
			if typeof(map_.enemies[i].draw) == "string" {
				log(map_.enemies[i].draw, script_get_index(map_.enemies[i].draw));
				map_.enemies[i].draw = script_get_index(map_.enemies[i].draw);
			}*/
			log(map_.enemies[i]);
			var chump = c_spawnenemy(map_.enemies[i].x, map_.enemies[i].y, friend/*map_.enemies[i]*/, !editing);
			var newman = deep_copy(map_.enemies[i]);
			chump.links = newman.links;
			//chump.depth = newman.depth;
			//chump.variation = newman.variation;
			chump.thing = newman;
			array_push(enemies, newman);
			
		}
		//enemies = map_.enemies;
		//instance_create(10 tiles, 10 tiles, DEFINE);
		if !instance_exists(DEFINE) {
			instance_create(map_.spawn.x, map_.spawn.y, DEFINE);
		}
		iterate map_.triggers to {
			//c_spawnenemy(map_.enemies[i].x, map_.enemies[i].y, map_.enemies[i]).links = map_.enemies[i].links;
			log(map_.triggers[i]);
			chump = c_maketrigger(
				map_.triggers[i].x,
				map_.triggers[i].y,
				map_.triggers[i].x2,
				map_.triggers[i].y2,
				script_get_index(map_.triggers[i].enter),
				script_get_index(map_.triggers[i].stay),
				script_get_index(map_.triggers[i].leave),
				script_get_index(map_.triggers[i].step)
			);
			chump.target = map_.triggers[i].target;
			chump.targetx = map_.triggers[i].targetx;
			chump.targety = map_.triggers[i].targety;
			array_push(triggers, chump);
		}
		global.currentmap = map_;
		global.currentbackground = global.backgrounds[$map_.bg];
		global.currentspawn = map_.spawn;
	}
	if dissolve instance_destroy(o_mapper);
	
	var mytiles = instance_get_all(o_solid);
	iterate mytiles to {
		with mytiles[i] {
			var config = [
				[place_meeting(x-16, y-16, o_solid), place_meeting(x, y-16, o_solid), place_meeting(x+16, y-16, o_solid)],
				[place_meeting(x-16, y, o_solid), 1, place_meeting(x+16, y, o_solid)],
				[place_meeting(x-16, y+16, o_solid), place_meeting(x, y+16, o_solid), place_meeting(x+16, y+16, o_solid)],
			];
			
			var left = config[1][0];
			var right = config[1][2];
			var up = config[0][1];
			var down = config[2][1];
			
			image_index = 0;
			
			if right {
				image_index = 1;
			}
			if left {
				image_index = 3;
			}
			if down {
				image_index = 13;
			}
			if up {
				image_index = 33;
			}
			if up && down {
				image_index = 23;
			}
			if left && right {
				image_index = 2;
			}
			if right && down {
				image_index = 10;
			}
			if left && down {
				image_index = 12;
			}
			if right && up {
				image_index = 30;
			}
			if left && up {
				image_index = 32;
			}
			if left && right && down {
				image_index = 11;
			}
			if left && right && up {
				image_index = 31;
			}
			if up && left && down {
				image_index = 22;
			}
			if up && right && down {
				image_index = 20;
			}
			if up && left && right && down {
				image_index = 21;
			}
		}
	}
}