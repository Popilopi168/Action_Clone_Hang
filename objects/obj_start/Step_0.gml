if (state == "dialog") {
    // Existing code to handle advancing the dialog
    if (waiting_for_click && mouse_check_button_pressed(mb_left)) {
        audio_play_sound(snd_tomato, 10, false);
        waiting_for_click = false; // Reset the waiting flag
        current_text_index += 1; // Move to the next text line

        // If there are more lines to show, reset variables for the next text
        if (current_text_index < array_length_1d(dialog_text)) {
            letters_to_display = 0;
            text_finished = false;
        } else {
            if (is_undefined(selected_choice)) {
                // Show choices if no choice has been made yet
                state = "choices";
            } else {
                // All dialog completed after choice
                state = "done";
            }
        }
    }
} else if (state == "choices") {
	var prev_hovered_choice_index = hovered_choice_index;
    // Handle choice selection
    if (mouse_check_button_pressed(mb_left)) {
        // Use different variable names to avoid conflicts with built-in variables
        var gui_mouse_x = device_mouse_x_to_gui(0); 
        var gui_mouse_y = device_mouse_y_to_gui(0);

        var choice_box_width = 200;
        var choice_box_height = 50;
        var choice_gap = 20;
        var total_height = (choice_box_height * array_length(opt_list)) + (choice_gap * (array_length(opt_list) - 1));
        var start_y = (view_hport[0] - total_height) / 2; // Center vertically
        var choice_x = (view_wport[0] - choice_box_width) / 2; // Center horizontally

        for (var i = 0; i < array_length(opt_list); i++) {
            var choice_y = start_y + i * (choice_box_height + choice_gap);

            // Check if mouse is over this choice
            if (gui_mouse_x >= choice_x && gui_mouse_x <= choice_x + choice_box_width &&
                gui_mouse_y >= choice_y && gui_mouse_y <= choice_y + choice_box_height) {
					
				// hover for choice
				hovered_choice_index = i;
				if (hovered_choice_index != prev_hovered_choice_index) {
	                audio_play_sound(snd_hover, 1, false);
	            }

                // A choice was selected
                selected_choice = opt_list[i];

                // Load the corresponding text based on the selection
                if (selected_choice == "tomato") {
                    dialog_text = tomato_text;
                } else if (selected_choice == "lettuce") {
                    dialog_text = lettuce_text;
					global.player_sprite_choice = "lettuce";
                } else if (selected_choice == "human") {
                    dialog_text = human_text;
					sprite_index = spr_potato_split_2;
					global.player_sprite_choice = "human";
                }

                // Reset dialog variables
                current_text_index = 0;
                letters_to_display = 0;
                text_finished = false;
                waiting_for_click = false;

                // Return to dialog state to display the selected text
                state = "dialog";

                break; // Exit the loop after selecting a choice
            }
        }
    }
} else if (state == "done") {
    room_goto(room0);
}


// Check if the left mouse button is pressed
if (mouse_check_button_pressed(mb_left)) {
    // Increase the alpha by a certain amount
    image_alpha += 0.25; // Adjust the increment as needed

    // Ensure alpha doesn't exceed 1
    if (image_alpha > 1) {
        image_alpha = 1;
    }
}