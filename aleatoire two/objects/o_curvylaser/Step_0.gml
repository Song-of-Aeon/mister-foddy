/// @description Insert description here
// You can write your code in this editor


event_inherited(); //super()

//x = mouse_x;
//y = mouse_y;


for(var i = array_length(linkList)-1; i >= 0; i--){
	if(!instance_exists(linkList[i])){
		array_resize(linkList,i);
		break;
	}
	linkList[i].friendly = friendly;
	//linkList[i].escapedistance = escapedistance;
}