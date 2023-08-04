function array_create_deref(length, val) {
	var i;
	var array = [];
	for (i=0; i<length; i++) {
		array[i] = deep_copy(val);
	}
	return array;
}

function array_create_order(max_, value=1, base=0) {
	var array = [];
	var i;
	var pos = 0;
	for (i=base; i<max_; i+=value) {
		array[pos] = i;
		pos++;
	}
	return array;
}