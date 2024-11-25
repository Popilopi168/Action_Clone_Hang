/// @description Insert description here
// You can write your code in this editor

// gradually become visible
if (mouse_check_button_pressed(mb_left)) {
    // Increase the alpha
    image_alpha += 0.1; 

    // Ensure alpha doesn't exceed 1
    if (image_alpha > 1) {
        image_alpha = 1;
    }
}