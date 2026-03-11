draw_self();

draw_set_color(c_lime);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);

draw_self();
draw_set_color(c_red);
draw_circle(x, y, 2, false);