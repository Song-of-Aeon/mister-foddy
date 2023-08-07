nu bullet("enemy", s_enemybullet, 1, true, false, 1);

function pt_bowap() {
	if ncm(12, c) c_shootcircle(x, y, 2, easemult(ac_sin, count, 600, 1080)+count*.03, 6, bul.enemy);
}

function pt_ranges() {
	if ncm(30, c) {
		var i;
		for (i=0; i<3; i++) {
			c_shootcircle(x, y, .5+i*.7, count*.4, 4, bul.enemy);
		}
	}
}

function pt_everything() {
	switch mode {
		case 0:
			if ncm(40, c) {
				var i;
				for (i=0; i<2; i++) {
					c_shootcircle(x, y, 1+i*.7, count*.4, 3, bul.enemy);
				}
			}
			break;
		case 1:
			statish("targdir", 0);
			if ncm(3 sec, c) {
				targdir = point_me();
			}
			if count%(3 sec) < 1 sec && ncm(3) {
				c_shoot(x, y, 2, targdir, bul.enemy, u, function() {
					c
					if count+iterations < 200 {
						tspd = easemult(ac_sin, count, 60, 6);
					} else {
						tspd = 0;
					}
				}).iterations = random(30);
				c_shoot(x, y, 2, targdir, bul.enemy, u, function() {
					c
					if count+iterations < 200 {
						tspd = -easemult(ac_sin, count, 60, 6);
					} else {
						tspd = 0;
					}
				}).iterations = random(30);
			}
			break;
		case 2:
			if ncm(30, c) {
				var i;
				for (i=0; i<4; i++) {
					c_shoot(x, y, 2, easemult(ac_linear, count, 120, 30)+i*90, bul.enemy)
				}
			}
			break;
		case 3:
			if ncm(40, c) c_shootcircle(x, y, 2, easemult(ac_siddn, count, 600, 1080)+count*.03, 6, bul.enemy, u, function() {vspd += .03});
			break;
		case 4:
			if ncm(60, c) {
				c_shoot(x, y, 2, point_me()+30*itneg(), bul.enemy, u, function() {
					c
					if ncm(32) {
						var split = irandom(20)-10;
						var speeed = random(.4);
						c_shoot(x, y, 1+speeed, dir+90+split, bul.enemy);
						c_shoot(x, y, 1+speeed, dir-90+split, bul.enemy);
					}
				});
				iterations++;
			}
			break;
	}
	if count > 16 sec {
		count = 0;
		iterations = 0;
		var oldmode = mode;
		do {
			mode = irandom(4);
		} until mode != oldmode;
	}
}