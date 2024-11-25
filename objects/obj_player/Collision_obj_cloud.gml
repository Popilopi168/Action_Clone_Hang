/// @description Insert description here
// You can write your code in this editor


with (other){
	if (other.colliding == true){
		sprite_index = spr_tiny_cloud_poof;

		image_index = 1;
		if (!poof) audio_play_sound(snd_drop, 10, false);
		image_speed = 0.7;
		poof = true;
		
	}
}