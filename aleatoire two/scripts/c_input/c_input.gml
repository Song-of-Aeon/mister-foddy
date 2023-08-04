function c_input() {
	var i;
	var inputs = variable_struct_get_names(global.inputs);
	for (i=0; i<array_length(inputs); i++) {
		set_value(self, inputs[i], global.inputs[$inputs[i]]);
	}
	
	//these guys are compounds that are per-instance of c_input
	
	select = jump.hit;
	back = attack.hit;
	undo = ctrl.hold & zed.hit;
}

function c_inputupdate() {
	/*var dudes = array_collapse(global.joysticks);
	for (i=0; i<array_length(dudes); i++) {
		dudes[i].update();
	}*/
	global.joysticks[gp_axislh].update();
	global.joysticks[gp_axislv].update();
	global.joysticks[gp_axisrh].update();
	global.joysticks[gp_axisrv].update();
	
	var inputs = variable_struct_get_names(global.inputs);
	var i;
	for (i=0; i<array_length(inputs); i++) {
		global.inputs[$inputs[i]].update();
	}
	
	
}


function c_inputload() {
	global.inputs = {};
	nu kinput("left", [vk_left, "A"]);
	nu kinput("down", [vk_down, "S"]);
	nu kinput("up", [vk_up, "W"]);
	nu kinput("right", [vk_right, "D"]);
	
	nu kinput("jump", [vk_space], "Left item");
	nu kinput("attack", [mb_left], "Center item");
	nu kinput("reload", ["R"], "Right item");
	nu kinput("shift", [vk_shift], "Focus");
	nu kinput("inventory", ["Q"], "Inventory");
	nu kinput("debug", ["G"], "Debug");
	
	nu kinput("skip", [vk_tab, gp_face4], "Map / Skip");
	nu kinput("ctrl", [vk_control], "Skip text");
	nu kinput("zed", ["Z"], "z");
	nu kinput("yed", ["Y"], "y");
	nu kinput("null", []);
}

function kinput(name_, keys_, displayname_=name_, compositekeys_=[], axisdir_=0) constructor {
	name = name_;
	key = keys_;
	log(key);
	displayname = displayname_;
	compositekeys = compositekeys_;
	axis = axisdir_;
	hit = 0;
	hold = 0;
	drop = 0;
	//axes = array_create(gp_axis_orientation_w); //yeah ill finish this later
	
	update = function() {
		var i, j;
		hit = false;
		hold = false;
		drop = false;
		iterate compositekeys to {
			for (j=0; j<array_length(global.inputs[$compositekeys[i]].key); j++) {
				hit |= input_active(global.inputs[$compositekeys[i]].key[i], INPUT.PRESSED, axis);
				hold |= input_active(global.inputs[$compositekeys[i]].key[i], INPUT.HELD, axis);
				drop |= input_active(global.inputs[$compositekeys[i]].key[i], INPUT.RELEASED, axis);
			}
		}
		for (i=0; i<array_length(key); i++) {
			
			hit |= input_active(key[i], INPUT.PRESSED, axis);
			hold |= input_active(key[i], INPUT.HELD, axis);
			drop |= input_active(key[i], INPUT.RELEASED, axis);
		}
	}
	global.inputs[$name] = self;
}
global.inputs = {};
c_inputload();

/*function jinput(name_, axis_,) constructor {
	var me = global.inputs[$name_];
	me.axis = axis_;
	me.update = me ^ function() {
		
	}
}*/

function joystick(axis_) constructor {
	axis = axis_;
	val = 0;
	
	poshit = false;
	neghit = false;
	posdrop = false;
	negdrop = false;
	
	update = function() {
		var newval = gamepad_axis_value(0, axis);
		
		poshit = false;
		neghit = false;
		posdrop = false;
		negdrop = false;
	
		if val < global.deadzone && newval > global.deadzone {
			poshit = true;
		} else if val > global.deadzone && newval < global.deadzone {
			posdrop = true;
		}
		if val > -global.deadzone && newval < -global.deadzone {
			neghit = true;
		} else if val < -global.deadzone && newval > -global.deadzone {
			negdrop = true;
		}
	
		val = newval;
	}
	global.joysticks[axis] = self;
}

global.joysticks = [];
nu joystick(gp_axislh);
nu joystick(gp_axislv);
nu joystick(gp_axisrh);
nu joystick(gp_axisrv);

global.currentcontroller = CONTROLLERS.KEYBOARD;

enum CONTROLLERS {
	KEYBOARD,
	NINTENDO,
	PLAYSTATION,
	XBOX,
	DDR,
}