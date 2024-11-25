/// @description Insert description here
// You can write your code in this editor

instance_destroy();
respawning = false;
global.player_1_created = false;

if ( obj_var.time_left <= 0) {
    show_debug_message("Switching to rm_end");
	 room_goto(rm_end);
   
}