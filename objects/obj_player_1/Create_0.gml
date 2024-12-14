respawning = false;
scaling = false;
target_angle = 0;

// Load the corresponding text based on the selection
if (global.player_sprite_choice == "lettuce") {
    sprite_index = spr_lettuce;
} else if (global.player_sprite_choice == "human") {
    sprite_index = spr_human;
}else if (global.player_sprite_choice == "tomato") {
    sprite_index = spr_tomato;
}

image_speed = 0
image_index = 1;
