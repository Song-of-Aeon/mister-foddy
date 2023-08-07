function c_clearradius(_x, _y, radius, strong=false, includemine=false) {
	var cleared = 0;
	
	//var dudes = stullet_collide_list(_x, _y, radius);
	var dudes = ds_list_create();
	collision_circle_list(_x, _y, radius, o_bullet, true, false, dudes, false);
	var i;
	for (i=0; i<ds_list_size(dudes); i++) {
		if (strong || dudes[|i].destructible == true) && (includemine || dudes[|i].friendly == false) {
			cleared++;
			instance_destroy(dudes[|i]);
		}
	}
	ds_list_destroy(dudes);
	return cleared;
}