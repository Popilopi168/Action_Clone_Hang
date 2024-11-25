/// @description Insert description here

var view = view_camera[0]
var w = 320;
var h = 200;

camera_set_view_size(view, w, h);
// Get the current camera position
var _cur_x = camera_get_view_x(view);
var _cur_y = camera_get_view_y(view);

var _spd = 0.1; 

 if (instance_exists(obj_player_1) && obj_player_1.cam_focus) {
    // Only player 1 exists, follow player 1
    var _x = clamp(obj_player_1.x - w / 2, 0, room_width - w);
    var _y = clamp(obj_player_1.y - h / 2, 0, room_height - h);
	camera_set_view_pos(view,
    lerp(_cur_x, _x, _spd),
    lerp(_cur_y, _y, _spd)
);

}else{
	camera_set_view_pos(view,
    lerp(_cur_x, 0, _spd),
    lerp(_cur_y, 0, _spd));
}


if (room == rm_end) {
    // Reset in rm_end
	show_debug_message("cam in end")
    camera_set_view_pos(view, 0, 0);
}