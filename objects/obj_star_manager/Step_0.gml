/// @description Insert description here
// You can write your code in this editor

//check how many clouds there are
global.num_clouds = instance_number(obj_cloud);



// Check if the cloud number exceeds 5 and the player hasn't been created yet
if (global.num_clouds > 5 && !global.player_1_created) {	
	
    // Create the player object at a desired position (x, y)
    instance_create_layer(x,0, "Instances", obj_player_1);
	audio_play_sound(snd_showup, 10, false);
	obj_player_1.y_vel = 4;
	obj_player_1.x_vel = random_range(-10, 5)
    
    // Set the flag to true so the player is only created once
    global.player_1_created = true;
}



//count up the number of frames
frames_since_cloud += 1;

//IF we've waited the max number of frames OR
//if we have less than 2 clouds
if (frames_since_cloud > frames_bt_cloud || global.num_clouds < 2) {
	//IF we do not have the max num of clouds
	if(global.num_clouds < max_clouds) {
		//create a new cloud at a random position
		var new_cloud = instance_create_layer(
			random_range(30, room_width - 30),
			 room_height,
			"Instances",
			obj_cloud
		)
	
		//the with structure allows us to change the scope
		//of the following variables to whatever is in the paraenthesis
		//in this case, the scope is of the newly created cloud
		with(new_cloud) {
			//count how many times we tried to change the clouds position
			var tries = 0;
			//while we've tried less than 3000 times
			//and a cloud is inside our collider
			while(tries < 3000 && collision_rectangle(
				x-12, y-12, 
				x+12, y+12, 
				obj_cloud, 
				false, true) != noone) {
					//set the new cloud's position to a new random position
					//and count up the num of times we've tried to get
					//a new position
					x = random_range(30, room_width - 30);
					y = room_height; 
					
					tries +=1;
			}
		}
	}
	//since we just made a new cloud
	//reset the counter
	frames_since_cloud = 0;
}




