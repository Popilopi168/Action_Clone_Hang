draw_set_color(c_white);
// draw_set_font(f_dos);
draw_set_font(fnt_score);
draw_text(10, 10, "Item collected: " + string(global.player1_score));

draw_text(10, 30, "Time remaining: " + string(time_left));