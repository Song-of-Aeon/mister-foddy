/// @description Insert description here
// You can write your code in this editor
//event_inherited();

draw_set_color(c_white);
draw_set_alpha(1);

function getLinkDirection(link){ //unused rn
	var dir = point_direction(link.x,link.y,link.following.x,link.following.y);
	return dir-90;
}

var funny = false;
var dummyTexture = sprite_get_texture(sprite_index,0);
if(funny){
	var dummySurf = surface_create(32,32);
	var dummyTexture = surface_get_texture(dummySurf);
	//shader_set(z_curvyLaser);
}
//shader_set(z_curvyLaser);
//draw_primitive_begin_texture(pr_trianglestrip,dummyTexture); //creates a vertex buffer (dont do this lmao)
vertex_begin(vertexBuffer,vertexFormat);
//var link = linkList[0]
//var linkDist = distabs(getLinkDirection(link)+180,link.distance);
//draw_vertex_texture(link.x+linkDist.x,link.y+linkDist.y,0.5,0);

//draw_vertex_texture(x,y,0.5,0);
var vertInfo = texture_get_uvs(dummyTexture);

vertex_position(vertexBuffer,x,y);
var xpos = lerp(vertInfo[0],vertInfo[2],0.5); 
var ypos = lerp(vertInfo[1],vertInfo[3],0);
vertex_texcoord(vertexBuffer,xpos,ypos);
vertex_color(vertexBuffer,c_white,1);

for(var i = 0; i < array_length(linkList);i++){
	link = linkList[i];
	if(link.id == 0){ //link is dead
		break;
	}
	var linkx = link.x;
	var linky = link.y;
	//dir = getLinkDirection(link)
	var dir = point_direction(linkx,linky,link.following.x,link.following.y)-90;

	var side_ = ((i%2)*2)-1; //1 or -1
	//log(side);
	var add_ = distabs(dir+90 + (90*side_),laserWidth);

	//draw_vertex_color(link.x+add.x,link.y+add.y,c_red,255);
	var mult = 1;
	if(funny)
		mult = 20;
	//draw_vertex_texture(link.x+add_.x,link.y+add_.y,(i%2)*mult,(i/array_length(linkList))*mult);
	
	vertex_position(vertexBuffer,linkx+add_.x,linky+add_.y);
	
	var xpos = lerp(vertInfo[0],vertInfo[2],(i%2)*mult); 
	var ypos = lerp(vertInfo[1],vertInfo[3],(i/array_length(linkList))*mult);
	vertex_texcoord(vertexBuffer,xpos,ypos);
	vertex_color(vertexBuffer,c_white,1);
	//draw_set_color(c_white)
	//draw_point(link.x+add_.x,link.y+add_.y);
	//draw_set_color(c_black)
	//draw_stroke(link.x,link.y,link.x + add.x,link.y + add.y);
}
vertex_end(vertexBuffer);
vertex_submit(vertexBuffer,pr_trianglestrip,dummyTexture)
return;
if colorable {
	var dummyTexture = sprite_get_texture(colorcover,0);
	draw_primitive_begin_texture(pr_trianglestrip,dummyTexture);
	for(var i = 0; i < array_length(linkList);i++){
		var link = linkList[i];
		if(!instance_exists(link) || !instance_exists(link.following)){
			continue;
		}
		var dir = getLinkDirection(link);
		var side_ = ((i%2)*2)-1; //1 or -1
		//log(side);
		var add_ = distabs(dir+90 + (90*side_),laserWidth);

		//draw_vertex_color(link.x+add.x,link.y+add.y,c_red,255);
		var mult = 1;
		if(funny)
			mult = 20;
		draw_vertex_texture_color(link.x+add_.x,link.y+add_.y,(i%2)*mult,(i/array_length(linkList))*mult, color, 1);
		//draw_point(link.x+add_.x,link.y+add.y);
		//draw_stroke(link.x,link.y,link.x + add.x,link.y + add.y);
	}
	draw_primitive_end();
}
shader_reset();

