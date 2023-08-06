function st_shipdraw() {
	var i;
	for (i=0; i<array_length(points)-1; i++) {
		draw_stroke(points[i].x, points[i].y, points[i+1].x, points[i+1].y);
		draw_ring(points[i+1].x, points[i+1].y, 3);
	}
	weapons[0][0].draw();
	draw_self();
}