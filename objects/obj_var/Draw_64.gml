// make UI more noticable
draw_set_color(c_white);
draw_sprite(spr_score_ui, 0, 5, 5);
draw_roundrect(5, 5, 250, 60, 50);

draw_set_color(c_black);
// draw_set_font(f_dos);
draw_set_font(fnt_score);
draw_text(20, 10, "Item collected: " + string(global.player1_score));

draw_text(20, 30, "Time remaining: " + string(time_left));