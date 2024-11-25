if (poof && image_index >= sprite_get_number(sprite_index) - 1) {
    instance_destroy();
	global.player1_score += 1;
}

// Rising
r_y += up_vel;
var to_move_y = round(r_y);
y += to_move_y;
r_y -= to_move_y;

if (up_vel < 1) {
    up_vel -= 0.01; 
}

// Swinging
var swing_speed = 0.005;  
var swing_damping = 0.99; 
// Calculate the swinging effect based on time (image_index can act as time for oscillation)
x += cos(current_time * swing_speed) * swing_amplitude;
 swing_amplitude = lerp(0, 2, 1 - up_vel / 5);

// amplitude decrease
swing_amplitude *= swing_damping;

if (y<0){
	instance_destroy();
}