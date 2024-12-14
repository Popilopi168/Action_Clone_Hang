/// @description Insert description here
// You can write your code in this editor



event_inherited();
depth = -1;


//jump
if (keyboard_check_pressed(vk_space) && jumps_left>0) {
    y_vel -= 6; 
    jumps_left -= 1; 
	audio_play_sound(snd_tomato, 10, false);
	
	//random rotation
	target_angle = irandom_range(0, 4)*30;
	
	// 6 particles spreading out from the player
    for (var i = 0; i < 6; i++) {
        var angle = irandom_range(0,359);
        var dist = 8 + random(8); 
        var px = x + lengthdir_x(dist, angle);
        var py = y + lengthdir_y(dist, angle);

        // Create a single particle at (px, py)
        part_particles_create(global.partSystem, px, py, global.partBasic, 1);
    }
	
	// Start the scaling animation
    scaling = true;
    scale_timer = 0;
}


// bounce game feel
if (scaling) {
    scale_timer += 1;
    var duration = 10; 
    var t = scale_timer / duration; 

    var max_scale = 1.4;
    var factor = sin(t * pi);  
    image_xscale = 1 + (max_scale - 1)*factor;
    image_yscale = image_xscale;

    // time is up, reset scale
    if (scale_timer >= duration) {
        image_xscale = 1;
        image_yscale = 1;
        scaling = false;
    }
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
	global.player1_score = 0;
	audio_play_sound(snd_drop, 10, false);
	alarm[0] = 2*room_speed;
	respawning = true;
	//Alarm[0] event:

}


var lerp_speed = 0.3;
image_angle = lerp(image_angle, target_angle, lerp_speed);



if (global.player1_score == 20){
	sprite_index = spr_potato;
}