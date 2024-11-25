// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


var _p = part_type_create();

part_type_speed(_p, 2, 4, 0, 0);
part_type_life(_p, 20, 40);

part_type_sprite(_p, spr, false, false, false);

part_type_size(_p, 0.1, 0, -0.01, 0);
part_type_direction(_p, 0, 180, 0, 0);
part_type_orientation(_p, 0, 0, 0, 0, true);
	
global.partBasic = _p;
