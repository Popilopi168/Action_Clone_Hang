// Existing variables
opt_list = ["lettuce", "tomato", "human"];

dialog_text = [
    "Who are you?",
    "Don't worry, we won't leak your personal information."
];
			   
tomato_text = [
    "Ah, a tomato! Welcome!",
    "Life as a tomato must be tough, huh?",
    "You're too delicate to be stored for long, which is why potatoes are more popular worldwide.",
    "But you're here seeking change, aren't you?",
    "As a potato, your high starch content makes you easier to store.",
    "Imagine being transformed into crispy fries—no matter how long you've been stored, people will always love you!",
    "You're about to receive affection from all kinds of people.",
    "Do me a favor, collect as much bubble as you can. Then I will help you as much as I can."
];

lettuce_text = ["Ah, a lettuce! Dialog in this chapter is under contruction"];
human_text = ["Ah, a human! Dialog in this chapter is under contruction"];

current_text_index = 0; // current dialog index
letters_to_display = 0; 
text_finished = false; // if the current text is fully shown
waiting_for_click = false; 

// text box
window_box_width = 280 * 2;
window_box_height = 80 * 2;
text_padding = 20;
line_spacing = 20;
max_width = window_box_width - 20;
box_x = (view_wport[0] - window_box_width) / 2;
box_y = view_hport[0] - window_box_height - 20;

image_speed = 0.3;

//state management
selected_choice = undefined; 
state = "dialog"; // "dialog" / "choices" / "done"


// Initialize click count and total clicks needed
click_count = 0;