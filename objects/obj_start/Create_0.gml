opt_list = ["lettuce", "tomato", "human"];

dialog_text = [
    "Who are you? And what brings you here?",
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
    "Do me a favor, collect 20 bubbles if you can. Then I will help you as much as I can."
];

lettuce_text = ["Ah, a lettuce! Dialog in this chapter is under contruction.",
				"Okay actually I'm joking, the goal for the assignment is to have a complete playable version so I will not leave here as blank",
				"It just the author kinda stuck at giving you a proper background story, but also do not want you insert some random GPT generated stuff here...", 
				"They hate lettuce (actually they just hate all green vegetables so don't take it personally hahah)",
				"Anyway just collect 20 bubbles for me, I will find a reason for this later...(Maybe?"];
human_text = ["Eh, a human...",
				"Sorry could you just keep away from me a little bit? I'm allergic to humankind...",
				"Oh I'm gonna pinch my nose if I have one...",
				"Stirring a bowl of cold chowder, that's how your life smells like.",
				"I will turn your life and your plan into potatoes",
				"Let me bring you to a simmer with little bubbles, and boil you up until the next day.",
				"Just like how I soak all the mess in, melt it, and make it thick."];

current_text_index = 0; // current dialog index
letters_to_display = 0; 
text_finished = false; // if the current text is fully shown
waiting_for_click = false; 

// text box
window_box_width = 280 * 2;
window_box_height = 80 * 2;
text_padding = 20;
line_spacing = 20;
max_width = window_box_width - 40;
box_x = (view_wport[0] - window_box_width) / 2;
box_y = view_hport[0] - window_box_height - 20;

image_speed = 0.3;

//state management
selected_choice = undefined; 
state = "dialog"; // "dialog" / "choices" / "done"


// Initialize click count and total clicks needed
click_count = 0;


hovered_choice_index = -1;