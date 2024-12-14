/// @description Insert description here
// You can write your code in this editor

//slow the player down on the x-axis
x_vel *= 0.9

//adding gravity to the y velocity
y_vel += grav;


//r = remainder
//add the current speed to the leftover
//speed from the last frame
r_y += y_vel;
r_x += x_vel;

//round the velocity
//these are the pixels we're moving this frame
var to_move_y = round(r_y);
var to_move_x = round(r_x);

//remove the rounded amount so that we have the leftover speed
r_y -= to_move_y;
r_x -= to_move_x;

//find the distance between the player and the walls
var dist_to_r_wall = room_width - x - 8;
var dist_to_l_wall = x - 8;

//if we've hit the right wall
if(to_move_x >= dist_to_r_wall) {
	//nudge the player to the left
	x = room_width - 9;
	//reverse our velocity
	x_vel = abs(x_vel) * -1;
	//reset the remainder variable
	r_x = 0;
} else if(to_move_x < -dist_to_l_wall) {
	//if we've hit the left wall

	//nudge to the right
	x = 9; 
	//reverse the velocity
	x_vel = abs(x_vel);
	//reset the remainder variable
	r_x = 0;
} else {
	//otherwise
	//move however much we need to move this frame
	x += to_move_x;
}

//find the y direction that we're moving
var dir = sign(to_move_y);
if (dir>0){
	//image_index = 1;
} 
else{
	//image_index = 2;
}


while (to_move_y != 0) {
    colliding = false;
    var y_next = y + sign(to_move_y);

    // Check collision with floor when moving down
    if (sign(to_move_y) > 0) {
        var collidewith_floor = instance_place(x, y_next, obj_floor);
        if (collidewith_floor != noone) {
            // Ensure we're colliding from above
            if (bbox_bottom <= collidewith_floor.bbox_top) {
                colliding = true;
                // Adjust position to stand on top of the floor
                y = collidewith_floor.bbox_top - (bbox_bottom - y);
                y_vel = 0;
                r_y = 0;
                to_move_y = 0;
				jumps_left = 2
                break;
            }
        }
    }

    // Check collision with clouds in any direction
    var collidewith_cloud = instance_place(x, y_next, obj_cloud);
    if (collidewith_cloud != noone) {
        colliding = true;
        // Stop movement upon collision
        y_vel = -2;

        // Call the collision event with the cloud
        with (collidewith_cloud) {
            event_perform(ev_collision, obj_player);
        }
        break;
    }

    // If no collision, proceed with movement
    if (!colliding) {
        y = y_next;
        to_move_y -= sign(to_move_y);
    }
}