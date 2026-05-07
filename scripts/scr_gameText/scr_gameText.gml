// Tutorial by Peyton Burnham
// Branching Dialog System with Effects in GMS 2! (Part 2: Branching Dialog)
// https://www.youtube.com/watch?v=6Bzj7GdSkJI

/// @param text_id
function scr_gameText(_text_id){
	switch(_text_id){
		case "npc 1":
			scr_text("Hi I'm Happy Derp", "Happy Derp", -1);
			scr_text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna. Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.", "Happy Derp", -1)
			scr_text("Happy Derp is derpy and happy");
			scr_text("Oh hey Happy Derp", "Player", 1);
			scr_text("Nice to meet you", "Happy Derp", -1);
				scr_option("Nice to meet you too!", "npc 1 - nice");
				scr_option("Get lost", "npc 1 - mean");
			break;
			case "npc 1 - nice":
				scr_text("Nice too meet you too Happy Derp", "Player", 1);
				scr_text("YAAAYYY NEW FREN :D", "Happy Derp", -1);
				scr_text("Man this guy is annoying")
				scr_text("We're no strangers to love. You know the rules and so do I. A full commitment's what I'm thinking of. You wouldn't get this from any other guy. I just wanna tell you how I'm feeling. Gotta make you understand. Never gonna give you up. Never gonna let you down. Never gonna run around and desert you. Never gonna make you cry. Never gonna say goodbye. Never gonna tell a lie and hurt you.", "Happy Derp", -1);
				scr_text("To Room 3");
				// room_goto(Room3);
				break;
			case "npc 1 - mean":
				scr_text("Get lost Happy Derp", "Player", 1);
				scr_text("We're no strangers to love. You know the rules and so do I. A full commitment's what I'm thinking of. You wouldn't get this from any other guy. I just wanna tell you how I'm feeling. Gotta make you understand. Never gonna give you up. Never gonna let you down. Never gonna run around and desert you. Never gonna make you cry. Never gonna say goodbye. Never gonna tell a lie and hurt you.", "Player", 1);
				scr_text("WAAAAHHHHH :((", "Sad Derp", 1);
				scr_text("To Room 1");
				// room_goto(Room1);
				break;			
			
		case "npc 2":
			scr_text("Sup! I'm NPC 2");
			scr_text("Lorem ipsum dolor sit amet.");
			break;
		case "npc 3":
			scr_text("Hey I'm Derpy Derp", "Derpy Derp");
			scr_text("Did you ever hear the tragedy of Darth Plagueis The Wise?", "Derpy Derp");
				scr_option("Yeah, I've heard of it", "npc 3 - know");
				scr_option("No, I haven't", "npc 3 - don't know");
			break;
			case "npc 3 - know":
				scr_text("Yeah, I've heard of it.", "Player", -1);
				scr_text("It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life…", "Player", -1);
				scr_text("Aww you stole my line man.", "Derpy Derp");
				scr_text("To Room 3");
				// room_goto(Room3);
				break;
			case "npc 3 - don't know":
				scr_text("No, I haven't. What's that?", "Player", -1);
				scr_text("I thought not. It's not a story the Jedi would tell you.", "Derpy Derp");
				scr_text("It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life…", "Derpy Derp");
				scr_text("To Room 1");
				// room_goto(Room1);
				break;				
		case "Adhila":
			scr_text("Hello player! Aku Adhila", "Happy Derp", 1);
			scr_text("Senang bertemu denganmu", "Happy Derp", 1);
			break;
		case "Lylia":
			scr_text("Hello player! Aku Lylia", "Happy Derp", -1);
			scr_text("It's dangerous to go alone. Take this!", "Happy Derp", -1);
			break;
	}
}