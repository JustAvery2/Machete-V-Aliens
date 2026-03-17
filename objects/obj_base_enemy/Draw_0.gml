draw_self();

if (path_index != -1)
{
    draw_set_color(c_yellow);
    draw_path(path_index, x, y, false);
    
    draw_text(x, y - 32, "Path Pos: " + string(path_position));
}