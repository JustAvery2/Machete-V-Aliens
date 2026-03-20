draw_self();


draw_set_color(c_black);
draw_rectangle(20, 20, 220, 40, false);

draw_set_color(c_red);
draw_rectangle(20, 20, 20 + (200 * (hp / max_hp)), 40, false);

draw_set_color(c_white);
draw_text(90, 22, string(hp) + "/" + string(max_hp));
