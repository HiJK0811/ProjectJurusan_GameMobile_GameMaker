// Tutorial by Peyton Burnham
// Branching Dialog System with Effects in GMS 2! (Part 2: Branching Dialog)
// https://www.youtube.com/watch?v=6Bzj7GdSkJI

/// @param text_id
function scr_gameText(_text_id){
	switch(_text_id){
		
	// == LYLIA ==
		// Lylia Intro
		case "Lylia_intro":
			scr_text("Halo, Selamat datang di Binusian Space Lounge", "Lylia", 1);
			scr_text("Perkenalkan nama saya Lylia, saya adalah pengurus tempat ini!", "Lylia", 1);
			scr_text("Kamu adalah Player bukan?", "Lylia", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Iya, saya Player", "intro_1");
			scr_option("Siapa?", "intro_2");
			break;
	
				case "intro_1":
					scr_text("Baik, senang bertemu denganmu, Player!", "Lylia", 1);
					scr_gameText("Lylia_intro_cont");
					break;
		
				case "intro_2":
					scr_text("Iya, itu kamu Player! hahaha", "Lylia", 1);
					scr_text("Senang bertemu denganmu!", "Lylia", 1);
					scr_gameText("Lylia_intro_cont");
					break;
			
			case "Lylia_intro_cont":
				scr_text("Ok Player, kamu pasti bingung dengan tempat ini! Saya jelaskan!", "Lylia", 1)
				scr_text("Ini adalah Binusian Space Lounge!", "Lylia", 1);
				scr_text("Tempat berkumpul mahasiswa dan karyawan BINUS di luar angkasa!", "Lylia", 1);
				scr_text("Iya, tempat ini beneran di luar angkasa", "Lylia", 1);
			
				scr_text("Tempat ini sudah berjalan mulus selama beberapa bulan...", "Lylia", 1);
				scr_text("Tetapi belakangan ini, mulai muncul beberapa masalah!", "Lylia", 1);
				scr_text("Seperti jukebox yang rusak, sistem navigasi yang kurang optimal, dan lain-lain...", "Lylia", 1);
			
				scr_text("Intinya, saya ingin kamu untuk membantu saya menyelesaikan masalah-masalah tersebut!", "Lylia", 1);
				// Input Player
				scr_text("?", "Player", -1);
				scr_option("Kenapa saya?", "intro_3");
				scr_option("Kenapa tidak orang lain yang membantu?", "intro_4")
				break;
						
					case "intro_3":
						scr_text("Saya yakin kamu adalah orang yang paling sesuai untuk melaksanakan tugas ini!.", "Lylia", 1);
						scr_gameText("Lylia_intro_last");
						break;
					case "intro_4":
						scr_text("Karena berdasarkan permasalahan yang ada sekarang...", "Lylia", 1);
						scr_text("Saya yakin kamu akan menyelesaikan masalah tersebut lebih baik daripada orang lain!", "Lylia", 1);
						scr_gameText("Lylia_intro_last");
						break;
			
			case "Lylia_intro_last":
				scr_text("~ Sepertinya saya ditugaskan untuk menyelesaikan permasalahan lounge! ~");
				scr_text("Jadi, kamu akan menyelesaikan masalah-masalah di beberapa ruagan di lounge!", "Lylia", 1);
				scr_text("Tidak apa-apa, kamu tidak harus menyelesaikan masalah tersebut secepatnya!", "Lylia", 1);
				scr_text("Kamu bisa keliling lounge terelebih dahulu untuk memperkenalkan diri!", "Lylia", 1);
				
				scr_text("Untuk masalah pertama, saya anjurkan kamu untuk memperbaiki jukebox di Cafe!", "Lylia", 1);
				scr_text("Jukeboxnya mengalami masalah kelistrikan yang menyebabkannya tidak berjalan!", "Lylia", 1);
				
				scr_text("Ok Player, semoga sukses dalam tugasnya!", "Lylia", 1);
				scr_text("Jika kamu ingin bantuan, kamu bisa bicara ke saya!", "Lylia", 1);
				
				obj_cutscene.introCompleted = true;
				//with (obj_cutsceneController) {
				//	introCompleted = true;
				//}
				break;
			
		
		// Lylia Logic Gate
		case "Lylia_post_intro":
			scr_text("Halo player!", "Lylia", 1);
			scr_text("Apakah kamu ada masalah dalam memperbaiki jukeboxnya?", "Lylia", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Saya butuh bantuan!", "jb_1");
			scr_option("Tidak ada, terima kasih", "jb_2")
			break;
			
				case "jb_1":
					scr_text("Ah, sepertinya kamu kurang tahu tentang Logic Gate! Saya jelaskan!", "Lylia", 1);
					scr_text("Jadi, tugasmu adalah menyalakan lampu dengan menekan sakelar yang disesuaikan dengan kondisi Logic Gate sebagai input agar arus di kabel bisa mengalir ke lampu!", "Lylia", 1);
					scr_text("Logic Gatenya terdiri dari: OR, AND, NOT, NOR, dan NAND!", "Lylia", 1);
					scr_text("Logic Gate OR akan benar jika ada salah satu input saja", "Lylia", 1);
					scr_text("Logic Gate AND akan benar jika ada semua input", "Lylia", 1);
					scr_text("Logic Gate NOT akan membalikkan input sekarang", "Lylia", 1);
					scr_text("Logic NOR adalah kebalikan OR dan akan benar jika tidak ada input sama sekali", "Lylia", 1);
					scr_text("Dan Logic Gate NAND adalah kebalikan AND dan akan salah jika ada kedua input!", "Lylia", 1);
					scr_text("Semoga kamu bisa memperbaiki jukeboxnya!", "Lylia", 1);
					scr_text("Saya akan menunggu di Cafe setelah kamu selesai memperbaiki jukeboxnya!", "Lylia", 1);
					break;
					
				case "jb_2":
					scr_text("Ok Player", "Lylia", 1);
					scr_text("Saya akan menunggu di Cafe setelah kamu selesai memperbaiki jukeboxnya!", "Lylia", 1);
					break;
			
	
			
			
	// // == Adhila ==
		case "Adhila":
			scr_text("Hello player! Aku Adhila", "Adhila", 1);
			scr_text("Senang bertemu denganmu", "Adhila", 1);
			break;
		
			
		//case "npc 1":
		//	scr_text("Hi I'm Happy Derp", "Happy Derp", -1);
		//	scr_text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna. Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.", "Happy Derp", -1)
		//	scr_text("Happy Derp is derpy and happy");
		//	scr_text("Oh hey Happy Derp", "Player", 1);
		//	scr_text("Nice to meet you", "Happy Derp", -1);
		//		scr_option("Nice to meet you too!", "npc 1 - nice");
		//		scr_option("Get lost", "npc 1 - mean");
		//	break;
		//	case "npc 1 - nice":
		//		scr_text("Nice too meet you too Happy Derp", "Player", 1);
		//		scr_text("YAAAYYY NEW FREN :D", "Happy Derp", -1);
		//		scr_text("Man this guy is annoying")
		//		scr_text("We're no strangers to love. You know the rules and so do I. A full commitment's what I'm thinking of. You wouldn't get this from any other guy. I just wanna tell you how I'm feeling. Gotta make you understand. Never gonna give you up. Never gonna let you down. Never gonna run around and desert you. Never gonna make you cry. Never gonna say goodbye. Never gonna tell a lie and hurt you.", "Happy Derp", -1);
		//		scr_text("To Room 3");
		//		// room_goto(Room3);
		//		break;
		//	case "npc 1 - mean":
		//		scr_text("Get lost Happy Derp", "Player", 1);
		//		scr_text("We're no strangers to love. You know the rules and so do I. A full commitment's what I'm thinking of. You wouldn't get this from any other guy. I just wanna tell you how I'm feeling. Gotta make you understand. Never gonna give you up. Never gonna let you down. Never gonna run around and desert you. Never gonna make you cry. Never gonna say goodbye. Never gonna tell a lie and hurt you.", "Player", 1);
		//		scr_text("WAAAAHHHHH :((", "Sad Derp", 1);
		//		scr_text("To Room 1");
		//		// room_goto(Room1);
		//		break;			
			
		//case "npc 2":
		//	scr_text("Sup! I'm NPC 2");
		//	scr_text("Lorem ipsum dolor sit amet.");
		//	break;
		//case "npc 3":
		//	scr_text("Hey I'm Derpy Derp", "Derpy Derp");
		//	scr_text("Did you ever hear the tragedy of Darth Plagueis The Wise?", "Derpy Derp");
		//		scr_option("Yeah, I've heard of it", "npc 3 - know");
		//		scr_option("No, I haven't", "npc 3 - don't know");
		//	break;
		//	case "npc 3 - know":
		//		scr_text("Yeah, I've heard of it.", "Player", -1);
		//		scr_text("It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life…", "Player", -1);
		//		scr_text("Aww you stole my line man.", "Derpy Derp");
		//		scr_text("To Room 3");
		//		// room_goto(Room3);
		//		break;
		//	case "npc 3 - don't know":
		//		scr_text("No, I haven't. What's that?", "Player", -1);
		//		scr_text("I thought not. It's not a story the Jedi would tell you.", "Derpy Derp");
		//		scr_text("It's a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life…", "Derpy Derp");
		//		scr_text("To Room 1");
		//		// room_goto(Room1);
		//		break;				
	}
}