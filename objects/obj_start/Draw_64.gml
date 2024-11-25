draw_sprite_stretched(spr_dialog_box, 0, box_x, box_y, window_box_width, window_box_height);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_score);

if (state == "dialog") {
    if (!text_finished) {
        text_shown = string_copy(dialog_text[current_text_index], 1, letters_to_display);
        letters_to_display += 1;

        // draw displayed text
        draw_text_ext(box_x + text_padding, box_y + text_padding, text_shown, line_spacing, max_width);

        // if the entire text line is displayed
        if (letters_to_display > string_length(dialog_text[current_text_index])) {
            text_finished = true;
            waiting_for_click = true; 
        }
    } else {
        // draw the fully displayed text
        draw_text_ext(box_x + text_padding, box_y + text_padding, dialog_text[current_text_index], line_spacing, max_width);
    }
} else if (state == "choices") {
    var choice_box_width = 200;
    var choice_box_height = 50;
    var choice_gap = 20;
    var total_height = (choice_box_height * array_length(opt_list)) + (choice_gap * (array_length(opt_list) - 1));
    var start_y = (view_hport[0] - total_height) / 2; // center vertically
    var choice_x = (view_wport[0] - choice_box_width) / 2; // center horizontally

    draw_set_font(fnt_score);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    for (var i = 0; i < array_length(opt_list); i++) {
        var choice_y = start_y + i * (choice_box_height + choice_gap);

        // Draw the choice box
        draw_set_color(c_black);
        draw_rectangle(choice_x, choice_y, choice_x + choice_box_width, choice_y + choice_box_height, false);

        // choice text centered within the box
        var text = opt_list[i];
        var text_x = choice_x + choice_box_width / 2;
        var text_y = choice_y + choice_box_height / 2;

        draw_set_color(c_white);
        draw_text(text_x, text_y, text);
    }
}

