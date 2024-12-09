/// @description Insert description here
// You can write your code in this editor

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);
draw_set_colour(c_black);
draw_rectangle(0, 0, 960, 600, false);


draw_set_colour(c_yellow);

score_string = string("You successfully made fries!");
draw_text(cx+cw/2, cy+32, score_string);

draw_sprite(spr_fries, 0, x, y);

if ( mouse_check_button_pressed(mb_left) && click_count<5) {
	 audio_play_sound(snd_tomato, 10, false);
	 
	draw_sprite(spr_fries, 0, 
	random_range(60,900),
	random_range(30, 600 - 30));
	
		draw_sprite(spr_fries, 0, 
	random_range(60,900),
	random_range(30, 600 - 30));
		draw_sprite(spr_fries, 0, 
	random_range(60,900),
	random_range(30, 600 - 30));
		draw_sprite(spr_fries, 0, 
	random_range(60,900),
	random_range(30, 600 - 30));
		draw_sprite(spr_fries, 0, 
	random_range(60,900),
	random_range(30, 600 - 30));
	click_count+=1;
	
}

if (click_count == 5) {
	room_goto(rm_start)
}