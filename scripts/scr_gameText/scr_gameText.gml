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
			scr_text("Hello player! Aku Adhila", "Adhila", 1);
			scr_text("Senang bertemu denganmu", "Adhila", 1);
			break;
		case "Lylia":
		    if (global.circuit_minigame_completed) {
		        scr_text("Wah, terima kasih ya udah benerin jukebox-nya!", "Happy Derp", -1);
		    } else {
		        scr_text("Kalau kamu memang mau coba Challenge Circuit, kita mulai dari yang paling ‘Lounge’", "Happy Derp", -1);
		    }
		    break;
			
					//Prolog
		case "Adhoc - calling":
				scr_text("Orang berikutnya", "Adhila", 1);
				break;	
		case "Adhoc - dialog":
				scr_text("hei,kamu sepertinya bukan orang yang sering mampir ke sini. apakah kamu orang luar?", "Adhila", 1);
				scr_text("iya,saya orang baru di stasiun ini! Ini pertama kalinya saya mendapat waktu istirahat dalam beberapa pekan ini.", "Player", 1);
				scr_text("wah,kamu ternyata astronaut pemula itu ya? Aku dengar perjalan ke planet sangat melelahkan dan kamu sudah menyelesaikan expedisi seorang diri.", "Adhila", 1);
				scr_text("wah…..beritanya sudah sampai ke sini ya ternyata,saya terasa tersanjung.", "Player", 1);
				scr_text("dikarenakan kamu orang baru,bolehkan aku meminta passport mu sebagai validasi", "Adhila", 1);
				scr_text("Siapa nama kamu?", "Adhila", 1);
					scr_option("SMA", "Adhoc - SMA");
					scr_option("SMK", "Adhoc - SMK");
				break;
				
				case "Adhoc - SMA":
				scr_text("Kamu ternyata adalah siswa yang ingin melanjutkan ke universitas ya? Bagaimana? Kamu gugup untuk melanjutkan ke fakultas mana?", "Adhila", 1);
					scr_option("Iya","SMA - yes");
					scr_option("Tidak, saya sudah menemukan jurusan saya","SMA - no" )
				break;
				
				case "SMA - yes":
				scr_text("owh….takut itu wajar sih buat anak muda karena melanjutkan akademik kejunjung tinggi bukanlah langkah yang besar,melainkan langkah yang berani biasanya jarang yang mau mengambil langkah itu.", "Adhila", 1);
				step = "Adhoc - continue";
				timer = 0; // reset biar timer==1 di case baru kepicu dari awal lagi
				break;
				
				case "SMA - no":
				scr_text("Kamu sudah ada? Bagus bagus kamu berarti sudah siap masuk kedunia perkampusan,semoga pilihan mu bisa menjadi alat di masa depan sana", "Adhila", 1);
				step = "Adhoc -  continue";
				timer = 0; // reset biar timer==1 di case baru kepicu dari awal lagi
				break;
				
					case "Adhoc - SMK":
				scr_text("Kamu, mengapa melangkah ke dunia kampus (user)? Apakah kamu ingin mengejar gelar demi kesempatan yang lebih luas? Dan kamu gugup tidak?", "Adhila", 1);
					scr_option("Takut itu wajar","SMK - takut");
					scr_option("Tidak, saya sudah menemukan jurusan saya","SMK - no takut" )
				break;
				
				case "SMK - takut":
				scr_text("kebetulan saya memang ingin mencari peluang yang lebih luas lagi,dan jika bilang takut wajar karena saya mengambil langkah akademik demi mencari kesempatan yang lebih baik dalam dunia kerja","Player",1);
				step = "Adhoc -  continue";
				timer = 0; // reset biar timer==1 di case baru kepicu dari awal lagi
				break;
				
				case "SMK - no takut":
				scr_text("Tidak takut,dan memang ini adalah pilihan optional yang saya ambil demi mencari peluang yang lebih luas,serta jika bisa dibilang ini adalah sebuah peruntungan nasib dengan jurusan yang saya cari", "Player", 1);
				step = "Adhoc -  continue";
				timer = 0; // reset biar timer==1 di case baru kepicu dari awal lagi
				break;
				
				case "Adhoc - continue":
				scr_text("baiklah verifikasi selesai, silahkan masuk (user)", "Adhila", 1);
				break;
				
		case "Lylia - problem":
				scr_text("hey, the music box stopped playing","Happy Derp",1);
				scr_text("yeah, it seems like it, we've been trying to fix it, but we haven't really got the time", "Lylia", 1);
				scr_text("Really? that's a shame","Happy Derp",1);
				break;	
				
		case "Lylia - fixed":
				scr_text("thankyou so much for fixing it","Lylia",1);
				break;	
	}
}