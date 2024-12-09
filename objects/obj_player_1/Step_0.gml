/// @description Insert description here
// You can write your code in this editor



event_inherited();
depth = -1;


//jump
if (keyboard_check_pressed(vk_space) && jumps_left>0) {
    y_vel -= 5; 
    jumps_left -= 1; 
	audio_play_sound(snd_tomato, 10, false);
}

//if we hit the left key
if(keyboard_check(ord(left_key))) {
	//decrease our x velocity by the acceleration
	x_vel -= accel;
}
//if we hit the right eye
if(keyboard_check(ord(right_key))) {
	//increase our x velocity by the acceleration
	x_vel += accel;
}



// check if fall out of window
if (y >room_height && !respawning){
	part_particles_create(global.partSystem, x, y, global.partBasic, 6)
	cam_focus = false;
	audio_play_sound(snd_drop, 10, false);
	alarm[0] = 2*room_speed;
	respawning = true;
	//Alarm[0] event:

}




if (global.player1_score == 20){
	sprite_index = spr_potato;
}