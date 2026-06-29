// Tutorial by Peyton Burnham
// Branching Dialog System with Effects in GMS 2! (Part 2: Branching Dialog)
// https://www.youtube.com/watch?v=6Bzj7GdSkJI

/// @param text_id
function scr_gameText(_text_id){
	switch(_text_id){
		
		// Lylia Intro
		case "Lylia_intro":
			scr_text("Halo, Selamat datang di Binusian Space Lounge", "Happy Derp", 1);
			scr_text("Perkenalkan nama saya Lylia, saya adalah pengurus tempat ini!", "Happy Derp", 1);
			scr_text("Kamu adalah player bukan?", "Happy Derp", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Iya, saya player", "intro_1");
			scr_option("Siapa?", "intro_2");
			break;
	
				case "intro_1":
					scr_text("Baik, senang bertemu denganmu, player!", "Happy Derp", 1);
					scr_gameText("Lylia_intro_cont");
					break;
		
				case "intro_2":
					scr_text("Haha, lucu sekali player!", "Happy Derp", 1);
					scr_text("Senang bertemu dneganmu!", "Happy Derp", 1);
					scr_gameText("Lylia_intro_cont");
					break;
			
			case "Lylia_intro_cont":
				scr_text("Ok player, kamu pasti bingung apa tempat ini!", "Happy Derp", 1)
				scr_text("Ini adalah Binusian Space Lounge!", "Happy Derp", 1);
				scr_text("Tempat berkumpul mahasiswa dan karyawan BINUS di luar angkasa!", "Happy Derp", 1);
				scr_text("Iya, tempat ini beneran di luar angkasa", "Happy Derp", 1);
			
				scr_text("Tempat ini sudah berjalan mulus selama beberapa bulan...", "Happy Derp", 1);
				scr_text("Tetapi belakangan ini, mulai muncul beberapa masalah!", "Happy Derp", 1);
				scr_text("Seperti jukebox yang rusak, sistem navigasi yang kurang optimal, dan lain-lain...", "Happy Derp", 1);
			
				scr_text("Intinya, saya ingin kamu untuk membantu memyelesaikan masalah tersebut!", "Happy Derp", 1);
				// Input Player
				scr_text("?", "Player", -1);
				scr_option("Kenapa saya?", "intro_3");
				scr_option("Kenapa tidak orang lain yang membantu?", "intro_4")
				break;
						
					case "intro_3":
						scr_text("Saya yakin kalau kamu bisa melaksanakan tugas ini dengan baik...", "Happy Derp", 1);
						scr_text("Dan kamu adalah orang yang paling cocok dibandingkan dengan orang lain!", "Happy Derp", 1);
						scr_gameText("Lylia_intro_last");
						break;
					case "intro_4":
						scr_text("Karena berdasarkan permasalahan yang ada sekarang...", "Happy Derp", 1);
						scr_text("Saya yakin kamu akan menyelesaikan masalah tersebut lebih baik daripada orang lain!", "Happy Derp", 1);
						scr_gameText("Lylia_intro_last");
						break;
			
			case "Lylia_intro_last":
				scr_text("~Sepertinya saya ditugaskan untuk menyelesaikan permasalahan lounge!~");
				scr_text("Jadi, kamu akan menyelesaikan beberapa masalah di ruang-ruang berbeda!", "Happy Derp", 1);
				scr_text("Tidak apa-apa, kamu tidak harus menyelesaikan masalahanya secepatnya!", "Happy Derp", 1);
				scr_text("Kamu bisa keliling lounge ini terelebih dahulu untuk memperkenalkan diri!", "Happy Derp", 1);
				
				scr_text("Untuk masalah pertama, saya anjurkan untuk memeperbaiki jukebox di Cafe!", "Happy Derp", 1);
				scr_text("Jukeboxnya mengalami masalah kelistrikan yang menyebabkannya tidak berjalan!", "Happy Derp", 1);
				
				scr_text("Ok player, semoga sukses dalam tugasnya!", "Happy Derp", 1);
				scr_text("Jika kamu ingin bantuan, kamu bisa bicara ke saya!", "Happy Derp", 1);
				
				obj_cutscene.introCompleted = true;
				//with (obj_cutsceneController) {
				//	introCompleted = true;
				//}
				break;
			
		
		// Lylia Logic Gate
		case "Lylia_post_intro":
			scr_text("Halo player!", "Happy Derp", -1);
			scr_text("Apakah kamu ada masalah dalam memperbaiki jukeboxnya?", "Happy Derp", -1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Saya butuh bantuan!", "jb_1");
			scr_option("Tidak ada, terima kasih", "jb_2")
			break;
			
				case "jb_1":
					scr_text("Ah, sepertinya kamu kurang tahu tentang Logic Gate! Saya jelaskan!", "Happy Derp", 1);
					scr_text("Jadi, tugasmu adalah menyalakan lampu dengan menekan sakelar yang disesuaikan dengan Logic Gate sebagai input agar arus di kabel bisa mengalir ke lampu!", "Happy Derp", 1);
					scr_text("Logic Gatenya terdiri dari: OR, AND, NOT, NOR, dan NAND!", "Happy Derp", 1);
					scr_text("Logic Gate OR akan benar jika ada salah satu input", "Happy Derp", 1);
					scr_text("Logic Gate AND akan benar jika ada semua input", "Happy Derp", 1);
					scr_text("Logic Gate NOT akan membalikkan input", "Happy Derp", 1);
					scr_text("Logic NOR adalah kebalikan OR dan akan benar jika tidak ada input", "Happy Derp", 1);
					scr_text("Dan Logic Gate NAND adalah kebalikan AND dan akan salah jika ada kedua input!", "Happy Derp", 1);
					scr_text("Semoga kamu bisa menmperbaiki jukeboxnya!", "Happy Derp", 1);
					scr_text("Saya akan menunggu di Cafe setelah kamu selesai!", "Happy Derp", 1);
					break;
					
				case "jb_2":
					scr_text("Ok player", "Happy Derp", 1);
					scr_text("Saya akan menunggu di Cafe setelah kamu selesai!", "Happy Derp", 1);
					break;
			
	
			
			
			
		case "Adhila":
			scr_text("Hello player! Aku Adhila", "Happy Derp", 1);
			scr_text("Senang bertemu denganmu", "Happy Derp", 1);
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