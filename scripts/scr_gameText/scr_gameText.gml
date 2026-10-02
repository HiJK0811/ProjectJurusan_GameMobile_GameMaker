// Tutorial by Peyton Burnham
// Branching Dialog System with Effects in GMS 2! (Part 2: Branching Dialog)
// https://www.youtube.com/watch?v=6Bzj7GdSkJI

/// @param text_id
function scr_gameText(_text_id){
	switch(_text_id){
	
	// == CHECK IN & SECURITY ROOM CUTSCENES ==
		case "Adhoc - intro":
			scr_text("Selamat datang!", "Security Officer");
			scr_text("Bolehkah saya cek identitas Anda?", "Security Officer");
			// Character creation process
			// Input name, dob, major, etc...
			scr_text("...", "Security Officer");
			scr_text("Baiklah, sepertinya Anda adalah astronot yang ditugaskan di sini!", "Security Officer");
			scr_text("Harap pergi ke ruangan selanjutnya untuk pemeriksaan lebih lanjut!", "Security Officer");
			scr_text("Terima kasih!", "Security Officer");
			break;
		
		case "Adhoc - calling":
			scr_text("Berikutnya!", "Mike");
			scr_text("...", "Mike");
			break;
			
		case "Adhoc - calling_2":
			scr_text("Halo! Anda mesti orang yang diutus untuk kerja di sini!", "Mike");
			scr_text("Sebelum ke lounge! silakan melalui proses pemeriksaan dahulu!", "Mike");
			scr_text("Terima kasih!", "Mike");
			break;
			
		case "Adhoc - dialog":
			scr_text("Proses pemeriksaan sudah selesai!", "Sri Kaya");
			scr_text("Anda layak masuk ke lounge!", "Sri Kaya");
			scr_text("Terima kasih!", "Sri Kaya");
			break;
	
	
	// == LYLIA ==
		case "Lylia_default":
			scr_text("Halo Player!", "Lylia", 1);
			scr_text("Senang bertemu denganmu!", "Lylia", 1);
			break;
			
		// Lylia Intro Cutscene
		case "Lylia_intro":
			scr_text("Halo, Selamat datang di Binusian Space Lounge!", "Lylia", 1);
			scr_text("Perkenalkan nama saya Lylia, saya adalah pengurus tempat ini!", "Lylia", 1);
			scr_text("Kamu adalah Player bukan?", "Lylia", 1);
			// Intro Player
			scr_text("?", "Player", -1);
			scr_option("Iya, saya Player", "intro_1");
			scr_option("Siapa?", "intro_2");
			break;
	
				case "intro_1":
					scr_text("Baik, senang bertemu denganmu, Player!", "Lylia", 1);
					scr_gameText("Lylia_intro_cont");
					break;
		
				case "intro_2":
					scr_text("Hahaha. Iya, itu kamu, Player!", "Lylia", 1);
					scr_text("Senang bertemu denganmu!", "Lylia", 1);
					scr_gameText("Lylia_intro_cont");
					break;
			
			case "Lylia_intro_cont":
				scr_text("Ok Player, kamu pasti belum familiar dengan tempat ini dan mengapa kamu ditugaskan disini!", "Lylia", 1)
				scr_text("Saya jelaskan!", "Lylia", 1);
				scr_text("Tempat ini adalah Binusian Space Lounge!", "Lylia", 1);
				scr_text("Tempat berkumpul mahasiswa dan karyawan BINUS di luar angkasa!", "Lylia", 1);
				scr_text("Iya, tempat ini beneran di luar angkasa", "Lylia", 1);
			
				scr_text("Tempat ini sudah berjalan lancar selama beberapa bulan...", "Lylia", 1);
				scr_text("Tetapi belakangan ini, mulai muncul beberapa masalah!", "Lylia", 1);
				scr_text("Seperti jukebox yang rusak, sistem navigasi yang kurang optimal, dan lain-lain...", "Lylia", 1);
			
				scr_text("Intinya, saya ingin kamu untuk membantu kami menyelesaikan masalah-masalah tersebut!", "Lylia", 1);
				// Reasoning
				scr_text("?", "Player", -1);
				scr_option("Kenapa harus saya?", "intro_3");
				scr_option("Kenapa tidak orang lain yang membantu?", "intro_4")
				break;
						
					case "intro_3":
						scr_text("Player, saya memanggil kamu karena kamu adalah orang yang terbaik untuk menyelesaikan masalah-masalah di sini!", "Lylia", 1);
						scr_text("Saya yakin kamu mampu dalam menyelesaikan masalah tersebut lebih baik daripada orang lain!", "Lylia", 1);
						scr_gameText("Lylia_intro_last");
						break;
					case "intro_4":
						scr_text("Karena berdasarkan permasalahan yang ada sekarang...", "Lylia", 1);
						scr_text("Saya yakin kamu akan menyelesaikan masalah tersebut lebih baik daripada orang lain!", "Lylia", 1)
						scr_text("Saya percaya dalam kemampuan kamu", "Lylia", 1);
						scr_gameText("Lylia_intro_last");
						break;
			
			case "Lylia_intro_last":
				scr_text("~ Sepertinya saya ditugaskan untuk menyelesaikan permasalahan lounge! ~");
				scr_text("Jadi, kamu akan menyelesaikan masalah-masalah di beberapa ruagan di lounge ini!", "Lylia", 1);
				scr_text("Tidak apa-apa, kamu tidak harus menyelesaikan masalah tersebut secepatnya!", "Lylia", 1);
				scr_text("Kamu bisa keliling lounge terlebih dahulu untuk memperkenalkan diri!", "Lylia", 1);
				
				scr_text("Untuk masalah pertama, saya anjurkan kamu untuk memperbaiki jukebox di Cafe!", "Lylia", 1);
				scr_text("Jukeboxnya mengalami masalah kelistrikan yang menyebabkannya tidak berjalan!", "Lylia", 1);
				scr_text("Berdasarkan manualnya, jukebox bisa diperbaikkan dengan memperbaiki gerbang logika di rangkaian listriknya!", "Lylia", 1);
				
				scr_text("Ok Player, semoga sukses dalam tugasnya!", "Lylia", 1);
				scr_text("Jika kamu membutuhkan bantuan, kamu bisa bicara ke saya!", "Lylia", 1);
				scr_text("Kamu bisa menemui saya di Cafe!", "Lylia", 1);
				
				obj_cutscene.introCompleted = true;
				//with (obj_cutsceneController) {
				//	introCompleted = true;
				//}
				break;
			
		
		// Lylia Logic Gate Intro
		case "Lylia_post_intro":
			scr_text("Halo player!", "Lylia", 1);
			scr_text("Apakah kamu ada kesulitan dalam memperbaiki jukeboxnya?", "Lylia", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Saya butuh bantuan!", "jb_1");
			scr_option("Tidak ada, terima kasih", "jb_2")
			break;
				
				// Logic Gate Explanation
				case "jb_1":
					scr_text("Ah, sepertinya kamu kurang paham mengenai Gerbang logika!", "Lylia", 1);
					scr_text("Saya akan jelaskan dengan mudah!", "Lylia", 1);
					scr_text("Jadi, tugasmu adalah menyalakan lampu dengan menekan sakelar atau input yang disesuaikan dengan kondisi Gerbang Logika sebagai ouput agar arus di kabel bisa mengalir ke lampu!", "Lylia", 1);
					scr_text("Gerbang logikanya terdiri dari: OR, AND, NOT, NOR, dan NAND!", "Lylia", 1);
					scr_text("Gerbang logika OR akan memberi ouput jika ada salah satu atau semua input", "Lylia", 1);
					scr_text("Gerbang logika AND hanya akan memberi ouput jika ada semua input", "Lylia", 1);
					scr_text("Gerbang logika NOT akan membalikkan input yang ada", "Lylia", 1);
					scr_text("Gerbang logika NOR adalah kebalikan OR dan akan memberi ouput jika tidak ada input sama sekali", "Lylia", 1);
					scr_text("Dan Gerbang logika NAND adalah kebalikan AND dan tidak akan memberi ouput jika ada kedua input!", "Lylia", 1);
					scr_text("Ok Player, Semoga kamu mengerti penjelasanku!", "Lylia", 1);
					scr_text("Dengan itu, kamu bisa kembali ke jukebox untuk memperbaikinya!", "Lylia", 1);
					scr_text("Saya akan menunggu di Cafe setelah kamu selesai memperbaiki jukeboxnya!", "Lylia", 1);
					break;
					
				case "jb_2":
					scr_text("Ok Player", "Lylia", 1);
					scr_text("Saya akan menunggu di Cafe setelah kamu selesai memperbaiki jukeboxnya!", "Lylia", 1);
					break;
			
		// Lylia after completing logic gate
		case "Lylia_post_logic":
			scr_text("Halo player!", "Lylia", 1);
			scr_text("Terima kasih telah memperbaiki jukeboxnya!", "Lylia", 1);
			scr_text("Bagaimana? Apakah tugas tersebut susah?", "Lylia", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Gampang sekali!", "jb_3");
			scr_option("Tadi sedikit susah!", "jb_4")
			break;
			
				case "jb_3":
					scr_text("Wow, kamu memang orang hebat!", "Lylia", 1);
					scr_text("Gerbang logika memerlukan pemikiran logika yang baik, dan kamu sanggup menyelesaikannya dengan mudah!", "Lylia", 1);
					scr_text("Keren sekali, Player!", "Lylia", 1);
					scr_gameText("Lylia_post_logic_cont");
					break;
					
				case "jb_4":
					scr_text("Tidak apa-apa Player, yang penting kamu sudah berusaha!", "Lylia", 1);
					scr_text("Dan berkat kamu, jukeboxnya mampu dibenarkan dan pengalaman pengunjung akan meningkat!", "Lylia", 1);
					scr_text("Keren, Player!", "Lylia", 1)
					scr_gameText("Lylia_post_logic_cont");
					break;
			
		case "Lylia_post_logic_cont":
			scr_text("Karena kamu sudah memperbaiki jukebox...", "Lylia", 1);
			scr_text("Selanjutnya, kamu bisa pergi ke Office, ruangan di paling kanan, dan bertemu dengan Adhila!", "Lylia", 1);
			scr_text("Di sana, dia akan menjelaskan detail terkait apa yang akan kamu kerjakan!", "Lylia", 1);
			scr_text("Player, jika kamu butuh istirahat terlebih dahulu, kamu bisa duduk sebentar di cafe sebelum ke sana! Ok!", "Lylia", 1);
			scr_text("Luangkan waktu kamu Player!", "Lylia", 1);
			break;
			
		// Lylia after player completed graph
		case "Lylia_post_graph":
			scr_text("Halo player!", "Lylia", 1);
			scr_text("Terima kasih telah memperbaiki sistem navigasinya!", "Lylia", 1);
			scr_text("Aku punya perasaan bahwa kamu bisa melakukannya!", "Lylia", 1);
			scr_text("Untuk permasalahan selanjutnya, harap pergi ke Storage Room yang berada di atas Cafe!", "Lylia", 1);
			scr_text("Semoga sukses dan luangkan waktumu Player!", "Lylia", 1);
			break;
			
		// Lylia after player completed Hanoi
		// case "Lylia_post_hanoi":
			// scr_text("Halo player!", "Lylia", 1);
			// scr_text("Terima kasih telah membantu Ami dalam memindahkan kontainernya!", "Lylia", 1);
			// scr_text("Ami sangat merindukan bantuan kamu, Player", "Lylia", 1);
			// scr_text("Dan sebagai temannya, saya sangat bangga dengan kamu!", "Lylia", 1);
			// scr_text(":D", "Lylia", 1);
			// scr_text("Untuk permasalahan selanjutnya, kamu bisa pergi ke Control Room yang berada dekat dengan Storage Room!", "Lylia", 1);
			// scr_text("Semoga sukses dan luangkan waktumu Player!", "Lylia", 1);
			// scr_gameText("Lylia_post_flowchart");
			// break;
			
		// Lylia after player completed flowchart
		// case "Lylia_post_flowchart":
			// scr_text("Halo player!", "Lylia", 1);
			// scr_text("Terima kasih telah membantu Roy dalam memperbaiki flowchartnya!", "Lylia", 1);
			// scr_text("Flowchart tersebut kami gunakan untuk menentukan SOP dan alur kerja karyawan kami!", "Lylia", 1);
			// scr_text("Dengan bantuan kamu, alur dan SOP akan jalan lebih baik dari sebelumnya!", "Lylia", 1);
			// break;
		
		// Lylia Sorting Intro
		case "Lylia_sorting_intro":
			scr_text("Halo Player!", "Lylia", 1);
			// scr_text("Sepertinya kamu sudah membantu Roy dalam memperbaiki flowchartnya...", "Lylia", 1);
			scr_text("Sepertinya kamu sudah membantu Ami dalam memindahkan kontainer", "Lylia", 1);
			scr_text("Terima kasih Player atas bantuan kamu!", "Lylia", 1);
			scr_text("Ami sangat merindukan bantuan kamu, Player", "Lylia", 1);
			scr_text("Dan sebagai temannya, saya sangat bangga dengan kamu!", "Lylia", 1);
			scr_text("Dengan itu, hanya tersisa satu permasalahan lagi Player!", "Lylia", 1);
			scr_text("Untuk permasalahan terakhir ini...", "Lylia", 1);
			scr_text("Permasalahan ini tidak susah, tetapi permasalahan ini sangat repetitif jika dilakukan berulang kali!", "Lylia", 1);
			scr_text("Jadi setiap hari di Cafe, saya dan staf saya harus sortir semua menu cafe dan pesanan pelanggan!", "Lylia", 1);
			scr_text("Untuk itu, saya minta kamu untuk membantu sortir menu cafe sesuai kebutuhan pelanggan agar kepuasan mereka meningkat!", "Lylia", 1);
			scr_text("Ok Player, tidak apa-apa kalau kamu ingin istirahat di sini terlebih dahulu!", "Lylia", 1);
			scr_text("Jika kamu sudah siap, kamu bisa bicara ke saya, Ok!", "Lylia", 1);
			break;
		
		// Lylia Sorting Minigame
		case "Lylia_sorting":
			scr_text("Halo Player!", "Lylia", 1);
			scr_text("Apakah kamu sudah siap?", "Lylia", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Iya!", "sort_1");
			scr_option("Saya belum siap!", "sort_2")
			break;
			
				case "sort_1":
					scr_text("Ok Player, itulah yang saya ingin dengar!", "Lylia", 1);
					scr_text("Kalau begitu, marilah kita mulai!", "Lylia", 1);
					scr_text("~ Saya akan bantu Lylia menyortir menu cafe ~");
					// Implement Continue Minigame
					break;
					
				case "sort_2":
					scr_text("Tidak apa-apa Player!", "Lylia", 1);
					scr_text("Bicara ke saya lagi kalau kamu sudah siap!", "Lylia", 1);
					scr_text("Ambil waktumu Player!", "Lylia", 1);
					break;
		
		// Lylia after completing sorting
		case "Lylia_sorting_outro":
			scr_text("Kamu keliling, kamu bantu, dan kamu mempunyai jiwa yang baik...", "Lylia", 1);
			scr_text("Kadang kontribusi tidak harus besar. Yang besar sering lahir dari yang teguh dan konsisten.", "Lylia", 1);
			scr_text("...", "Player", -1);
			scr_text("Oh, Halo Player!", "Lylia", 1);
			scr_text("Maaf tadi saya memikirkan tentang suatu puisi untukmu!", "Lylia", 1);
			scr_text("...", "Lylia", 1);
			scr_text("Player, Terima kasih atas semua bantuan dan kontribusi kamu di lounge!", "Lylia", 1);
			scr_text("Semua bantuan dan kontribusi kamu di lounge sangat berharga bagi saya, semua mahasiswa, dan staf di sini!", "Lylia", 1);
			scr_text("Sebagai apresiasi atas kerja kamu, saya memberikan kunci untuk ruang arcade, , ruang di sebelah Cafe yang paling bawah!", "Lylia", 1);
			scr_text("Kamu bisa memainkan ulang minigame yang kamu sudah mainkan!", "Lylia", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Baik, aku coba main kembali!", "arcade_1");
			scr_option("Aku senang pernah jadi bagian dari suasana ini!", "arcade_2");
			break;
			
				case "arcade_1":
					scr_text("Ok Player, selamat bermain!", "Lylia", 1);
					// scr_gameText("Lylia_game_outro");
					break;
					
				case "arcade_2":
					scr_text("Iya, saya juga senang sekali punya suasana dengan kamu", "Lylia", 1);
					// scr_gameText("Lylia_game_outro");
					break;
			
		// Lylia Game Outro / Goodbye, or is it?
		case "Lylia_game_outro":
			scr_text("Player...", "Lylia", 1);
			scr_text("Pekerjaan kamu di sini sudah selesai...", "Lylia", 1);
			scr_text("Jika kamu ingin pergi ke tempat lain, saya tidak akan menghalangimu!", "Lylia", 1);
			scr_text("Kamu bisa ke tempat boarding yang berada di sebelah waiting room...", "Lylia", 1);
			scr_text("Tetapi, jika kamu ingin tetap di sini, saya berterima kasih sekali lagi!", "Lylia", 1);
			scr_text("Tanpamu, tempat ini tidak akan sebaik dari sekarang!", "Lylia", 1);
			scr_text("Pilihannya di tangan kamu, Player!", "Lylia", 1);
			
		
	// == ADHILA ==
		case "Adhila_default":
			scr_text("Hai player!", "Adhila", 1);
			scr_text("Nama aku Adhila!", "Adhila", 1);
			scr_text("Aku mahasiswa BINUS yang sekarang lagi magang di lounge ini!", "Adhila", 1);
			scr_text("Salam kenal!", "Adhila", 1);
			break;
		
		// Adhila Intro Cutscene
		case "Adhila_intro":
			scr_text("Hai player!", "Adhila", 1);
			scr_text("Aku dengar kamu sudah memperbaiki jukebox...", "Adhila", 1);
			scr_text("Itu benar kan?", "Adhila", 1);
			// Input Player
			scr_text("?", "Player", -1);
			scr_option("Iya, saya memperbaikinya!", "adhila_intro_1");
			scr_option("Bukan saya", "adhila_intro_2");
			scr_option("Jukeboxnya memperbaiki sendiri!", "adhila_intro_3")
			break;
			
				case "adhila_intro_1":
					scr_text("Wow, terima kasih ya sudah memperbaikinya!", "Adhila", 1);
					scr_text("Memang Kak Lylia tidak bohong kalau kamu itu orang berbakat!", "Adhila", 1);
					scr_text("Karena kamu, cafenya tidak lagi membosankan dan sekarang sudah ada musik lagi!", "Adhila", 1);
					scr_gameText("Adhila_intro_cont");
					break;
					
				case "adhila_intro_2":
					scr_text("Haha jangan berbohong Player!", "Adhila", 1);
					scr_text("Aku sudah tahu kamu yang memperbaiknya karena Kak Lylia bilang ke aku lewat telefon!", "Adhila", 1);
					scr_text("Jadi, terima kasih sudah memperbaikinya!", "Adhila", 1);
					scr_text("Karena kamu, cafenya tidak lagi membosankan karena sekarang sudah ada musik lagi!", "Adhila", 1);
					scr_gameText("Adhila_intro_cont");
					break;
					
				case "adhila_intro_3":
					scr_text("Wah, benarkah?", "Adhila", 1);
					scr_text("Terakhir kali aku cek, jukeboxnya rusak...", "Adhila", 1);
					scr_text("Kok tiba-tiba jadi benar dengan sendirinya?", "Adhila", 1);
					scr_text("Hmmm..., sepertinya ada sesuatu atau seseorang yang memperbaikinya!", "Adhila", 1);
					
					scr_text("Player", "Adhila", 1);
					scr_text("Apakah kamu setuju kalau jukebox, sebuah benda mati, bisa memperbaikinya sendiri?", "Adhila", 1);
					// Input Layer	
					scr_text("?", "Player", -1);
					scr_option("Iya...", "adhila_intro_4");
					scr_option("...", "adhila_intro_5")
					break;
					
						case "adhila_intro_4":
							scr_text("Kok kamu kelihatan tidak yakin?", "Adhila", 1);
							scr_text("Heh, aku sudah tahu kalau kamu memperbaikinya, Player!", "Adhila", 1);
							scr_text("Karena Kak Lylia sudah memberi tahu saya lewat telefon!", "Adhila", 1);
							scr_text("Jadi, terima kasih ya sudah memperbaikinya!", "Adhila", 1);
							scr_gameText("Adhila_intro_cont");
						break;
					
						case "adhila_intro_5":
							scr_text("Hmm, kamu tidak tahu kah?", "Adhila", 1);
							scr_text("Heh, aku sudah duga kalau kamu yang memperbaikinya!", "Adhila", 1);
							scr_text("Karena Kak Lylia sudah memberi tahu saya lewat telefon!", "Adhila", 1);
							scr_text("Jadi, terima kasih ya sudah memperbaikinya!", "Adhila", 1);
							scr_gameText("Adhila_intro_cont");
						break;
					
			case "Adhila_intro_cont":
				scr_text("Ok, jadi untuk permasalahan sekarang...", "Adhila", 1);
				scr_text("Permasalahan ini mengenai sistem navigasi kita!", "Adhila", 1);
				scr_text("Sistem navigasi kita untuk rute antar-planet kurang optimal...", "Adhila", 1);
				scr_text("Ini menyebabkan gangguan navigasi dan keterlambatan datanganya kapal angkasa ke planet tujuan...", "Adhila", 1);
				scr_text("Untuk menyelesaikan masalah ini, aku ingin kamu membantu aku dan staf kita dalam memperbaiki sistem navigasinya!", "Adhila", 1);
				scr_text("Ok Player, untuk melaksanakan tugasnya, kamu bisa pergi ke ruang meeting yang berada di belakang pintu ini!", "Adhila", 1);
				scr_text("Semoga sukses player!", "Adhila", 1);
				break;
		
		// Adhila after cutscene
		case "Adhila_post_intro":
			scr_text("Hai Player!", "Adhila", 1);
			scr_text("Kamu boleh masuk ke ruang meeting di belakang pintu untuk memulai tugasnya!", "Adhila", 1);
			scr_text("Tidak harus cepat selesainya, kamu bisa ke kafe dulu kalau kamu butuh istirahat", "Adhila", 1);
			scr_text("Dan jika nanti kamu kesusahan mengerjakan tugasnya, kamu bisa nanya ke staf yang sedang bekerja di sana!", "Adhila", 1);
			scr_text("Ok Player, semoga sukses!", "Adhila", 1);
			break;
		
		// Adhila after completing graph
		case "Adhila_post_graph":
			scr_text("Hai player!", "Adhila", 1);
			scr_text("Terima kasih ya, sudah memperbaiki sistem navigasi kita!", "Adhila", 1);
			scr_text("Dengan perbaikan kamu, aku percaya kalau proses navigasi antarplanet menjadi lebih baik!", "Adhila", 1);
			scr_text("Untuk permasalahan di lounge, masih ada beberapa lagi!", "Adhila", 1);
			scr_text("Aku dengar kalau di Storage Room, Ami sedang mengalami permasalahan logistik...", "Adhila", 1);
			scr_text("dan menu di Cafe belum tersortir...", "Adhila", 1);
			scr_text("Aku yakin kamu bisa membantu menyelesaikan permasalahan-permasalahan tersebut!", "Adhila", 1);
			scr_text("Semoga sukses Player, dan sampai ketemu lagi!", "Adhila", 1);
			break;

	
	// == AMI ==
		case "Ami_default":
			scr_text("Hei Player!", "Ami", 1);
			scr_text("Namaku Ami", "Ami", 1);
			scr_text("Aku pengurus bagian logistik lounge ini!", "Ami", 1);
			break;
			
		// Ami and Lylia Cutscene (after graph minigame)
		case "Ami_intro":
			scr_text("Halo Ami, apakah kamu masih mengalami permasalahan di Storage Room?", "Lylia", 1);
			scr_text("Iya Lia, tetap ada masalah itu lagi...", "Ami", 1);
			scr_text("Proses logistik kita itu kurang efisien, Lia", "Ami", 1);
			scr_text("Kita sering mengirim barang ke planet lain, tetapi prosesnya sedikit lama dan tidak efisien!", "Ami", 1);
			scr_text("Dan ketika kita menerima barang, aku tidak mampu menyortir semua barang tersebut dalam waktu!", "Ami", 1);
			scr_text("Aku tidak tahu harus apa lagi, Lia...", "Ami", 1);
			scr_text("AKu sudah bekerja sekeras mungkin dan saya sering capai memikirkan hal ini!", "Ami", 1);
			scr_text("Wah, maaf sekali Ami, saya tidak tahu kamu harus bekerja sekeras ini!", "Lylia", 1);
			scr_text("Apakah yang saya bisa lakukan untuk membantumu?", "Lylia", 1);
			scr_text("Aku butuh pekerja lagi, Lia, dan aku tidak tahu siapa yang bisa membantu!", "Ami", 1);
			scr_text("Hmm, kalau saya boleh memberi rekomendasi...", "Lylia", 1);
			scr_text("Saya rekomen kamu untuk rekrut Player untuk membantumu!", "Lylia", 1);
			scr_text("Player kah, orang yang memperbaiki jukebox bukan? kenapa kamu rekomen dia?", "Ami", 1);
			scr_text("Bagaimana Player bisa membantu menyelesaikan masalah saya?", "Ami", 1);
			scr_text("Iya, dia itu yang memperbaiki jukeboxnya, dia juga barusan memperbaiki sistem navigasi kami!", "Lylia", 1);
			scr_text("Dan karena permasalahan kamu itu mirip dengan permasalahan yang Player sudah selesaikan...", "Lylia", 1);
			scr_text("Saya yakin Player akan bisa membantu permasalahanmu dengan baik!", "Lylia", 1);
			scr_text("Menyelesaikan masalah-masalah tersebut tidak gampang dan memerlukan pemikiran dan logika yang baik!", "Lylia", 1);
			scr_text("Hmm...", "Ami", 1);
			scr_text("Ok Lia, aku percaya kamu!", "Ami", 1);
			scr_text("Terima kasih Lia untuk sarannya!", "Ami", 1);
			scr_text("Tidak apa-apa Ami!", "Lylia", 1);
			scr_text("Lia itu Player bukan?", "Ami", 1);
			scr_gameText("Ami_intro_cont");
			break;
			
		case "Ami_intro_cont":
			scr_text("Halo Player!, ini Ami, pengurus logistik lounge!", "Lylia", 1);
			scr_text("Dia bekerja di Storage Room, ruangan di atas Cafe!", "Lylia", 1);
			scr_text("Apakah kamu sudah mengenal Ami?", "Lylia", 1);
			// Input Layer	
				scr_text("?", "Player", -1);
				scr_option("Iya, saya tadi kenalan dengan Ami", "ami_intro_1");
				scr_option("Saya belum terlalu mengenal Ami!", "ami_intro_2");
				break;
					
					case "ami_intro_1":
						scr_text("Iya, tadi Player bertemu dengan saya!", "Ami", 1);
						scr_text("Wow, bagus sekali kalian sudah kenalan!", "Lylia", 1);
						scr_text("Kata Lylia, kamu adalah orang yang cocok untuk menyelesaikan permasalahan saya!", "Ami", 1);
						scr_text("Iya betul, jadi Ami mempunyai masalah logistik yang perlu diselesaikan!", "Lylia", 1);
						scr_text("Iya nanti ketemu aku di Storage Room untuk menjelaskan lebih lanjut!", "Ami", 1);
						scr_text("Player, aku harus kembali kerja terlebih dahulu, sampai jumpa di sana!", "Ami", 1);
						scr_gameText("Ami_intro_last");
						break;
					
					case "ami_intro_2":
						scr_text("Ok Player, namaku Ami, salam kenal!", "Ami", 1);
						scr_text("Kata Lylia, kamu adalah orang yang cocok untuk menyelesaikan permasalahan saya!", "Ami", 1);
						scr_text("Iya betul, jadi Ami mempunyai masalah logistik yang perlu diselesaikan!", "Lylia", 1);
						scr_text("Iya nanti ketemu aku di Storage Room untuk menjelaskan lebih lanjut!", "Ami", 1);
						scr_text("Player, aku harus kembali kerja terlebih dahulu, sampai jumpa di sana!", "Ami", 1);
						scr_gameText("Ami_intro_last");
						break;
						
			case "Ami_intro_last":
				scr_text("Player, aku harap kamu bisa membantu Ami menyelesaikan masalah dia!", "Lylia", 1);
				// obj_cutscene.introCompleted = true;
				break;
			
		// Ami Hanoi Intro
		case "Ami_hanoi_intro":
			scr_text("Hei Player!", "Ami", 1);
			scr_text("kita ketemu lagi!", "Ami", 1);
			scr_text("Tanpa basa-basi, aku akan jelaskan apa yang kamu lakukan!", "Ami", 1);
			scr_text("Jadi, kamu membantu saya memindahkan kontainer-kontainer yang tertumpuk ke conveyor belt untuk dikirim!", "Ami", 1);
			scr_text("Sayangnya karena tempat ini terbatas dan kontainernya berat, kamu harus memindahkan kontainernya dengan cara tertentu!", "Ami", 1);
			// Input Layer	
				scr_text("?", "Player", -1);
				scr_option("Cara tertentu?", "ami_hanoi_1");
				scr_option("Apakah caranya mirip dengan Tower of Hanoi?", "ami_hanoi_2")
				break;
					
				case "ami_hanoi_1":
					scr_text("Maaf, aku kira kamu sudah tahu...", "Ami", 1);
					scr_text("Kamu bisa menggunakan cara Tower of Hanoi", "Ami", 1);
					scr_text("Kita menggunakan cara ini karena efisien dan clawnya tidak bisa memindahkan tumpukan kontainer!", "Ami", 1);
					scr_text("Untuk cara kerjanya, jadi kamu hanya bisa memindahkan kontainernya satu per satu dan tidak bisa menempatkan kontainer yang lebih besar di atas yang lebih kecil!", "Ami", 1);
					scr_text("Untuk ini, kamu harus hati-hati untuk tempat penempatan containernya!", "Ami", 1);
					scr_text("Karena hanya ada 3 tempat aja!", "Ami", 1);
					scr_text("Player, tidak apa-apa kalau kamu membuat kesalahan!", "Ami", 1);
					scr_text("Kadang saya melakukan kesalahan juga!", "Ami", 1);
					scr_gameText("Ami_hanoi_last")
					break;
					
				case "ami_hanoi_2":
					scr_text("Benar Player, Player!", "Ami", 1);
					scr_text("Kalau begitu, apakah kamu sudah tahu cara kerja Tower of Hanoi?", "Ami", 1);
					// Input Layer	
						scr_text("?", "Player", -1);
						scr_option("Iya, saya sudah tahu caranya!", "ami_hanoi_3");
						scr_option("Saya belum terlalu tahu!", "ami_hanoi_1")
						break;
							
					case "ami_hanoi_3":
						scr_text("Bagus sekali Player!", "Ami", 1);
						scr_gameText("Ami_hanoi_last")
						break;
						
			case "Ami_hanoi_last":
				scr_text("Ok Player, karena kamu sudah tahu cara kerjanya!", "Ami", 1);
				scr_text("Kamu bisa menggunakan control panel di sebelah saya untuk mengoperasikan clawnya untuk memindahkan kontainernya!", "Ami", 1);
				scr_text("Ingat, hanya satu kontainer setiap kali mindah dan bukan tumpukan!", "Ami", 1);
				scr_text("Dan Player, karena proses ini menguras waktu...", "Ami", 1);
				scr_text("Kamu bisa memilih 2 dari 3 tumpukan kontainer untuk dipindahkan!", "Ami", 1);
				scr_text("Atau kamu bisa menyelesaikan tiga-tiganya, jika kamu tidak keberatan!", "Ami", 1);
				scr_text("Semoga kamu bisa menyelesaikannya Player!", "Ami", 1);
				break;
		
		// Ami before completing Hanoi Minigame, after Hanoi intro
		case "Ami_pre_hanoi":
			scr_text("Hei Player!", "Ami", 1);
			scr_text("Semoga kamu bisa membantu saya memindahkan kontainernya!", "Ami", 1);
			scr_text("Kamu bisa membantu memindahkan 2 dari 3 tumpukan kontainernya!", "Ami", 1);
			scr_text("Atau kamu bisa menyelesaikan ketiga-tiganya jika kamu tidak keberatan!", "Ami", 1);
			scr_text("Saya bakal senang sekali jika kamu melakukannya!", "Ami", 1);
			break;
			
		// Ami after completing Hanoi minigame
		case "Ami_post_hanoi":
			scr_text("Hei player!", "Ami", 1);
			scr_text("Selamat telah membantu aku memindahkan tumpukan kontainernya!", "Ami", 1);
			scr_text("Aku berterima kasih banget kepadamu!", "Ami", 1);
			scr_text("Ini sangat berarti bagiku, jadi terima kasih lagi Player!", "Ami", 1);
			scr_text("Karena kamu sudah menyelesaikan masalah ini, kamu bisa menyelesaikan masalah lain di lounge atau istirahat dulu!", "Ami", 1);
			scr_text("Itu pilhanmu Player!", "Ami", 1);
			scr_text("Ok Player, sampai jumpa kembali!", "Ami", 1)
			// scr_text("~ Sekarang terdapat 2 masalah lagi! ~");
			// scr_text("~ Saya harap cek Control Room terlebih dahulu! ~");
			break;
		
	
	//// == Morty ==
	//	case "Morty_default":
	//		scr_text("Halo!", "Morty", 1);
	//		scr_text("Namaku Marty, salam kenal Player!", "Morty", 1);
	//		scr_text("Aku bekerja di Control Room dengan Pak Gregory!", "Morty", 1);
	//		break;
			
	//// == ROY ==
	//	case "Roy_default":
	//		scr_text("Halo Player!", "Roy", 1);
	//		scr_text("Perkenalkan, nama saya Roy!", "Roy", 1);
	//		scr_text("Saya adalah karyawan Control Room!", "Roy", 1);
	//		scr_text("Salam kenal dan senang bertemu denganmu!", "Roy", 1);
	//		break;
			
	//	// Roy Intro (after Hanoi)
	//	case "Roy_intro":
	//		scr_text("Halo Player, Saya Roy!", "Roy", 1);
	//		scr_text("Saya dengar Anda telah membantu Ami dalam memindahkan barang di Storage Room!", "Roy", 1);
	//		scr_text("Itu hebat sekali Player!", "Roy", 1);
	//		scr_text("Dengan itu, saya ingin memberi tahu sesuatu!", "Roy", 1);
	//		scr_text("Saya ingin Anda untuk membantu permasalahan di Control Room!", "Roy", 1);
	//		scr_text("Permasalahan ini mengenai SOP dan alur kerja lounge secara keseluruhan!", "Roy", 1);
	//		scr_text("Untuk detail permasalahannya, nanti saya jelaskan di sana!", "Roy", 1);
	//		scr_text("Player, apakah Anda sudah siap?", "Roy", 1);
	//		// Input Layer	
	//			scr_text("?", "Player", -1);
	//			scr_option("Saya sudah siap!", "roy_intro_1");
	//			scr_option("Saya harus istirahat terlebih dahulu!", "roy_intro_2")
	//			break;
		
	//			case "roy_intro_1":
	//				scr_text("Baiklah Player", "Roy", 1);
	//				scr_text("Saat Anda sudah siap, harap masuk ke Control Room!", "Roy", 1);
	//				scr_text("Jika Anda butuh istirahat terlebih dahulu, tidak apa-apa!", "Roy", 1);
	//				scr_text("Saya akan menunggu Anda di sana!", "Roy", 1);
	//				break;
							
	//			case "roy_intro_2":
	//				scr_text("Baiklah, tidak apa-apa Player", "Roy", 1);
	//				scr_text("Nanti jika Anda sudah siap, nanti bisa ke Control Room!", "Roy", 1);
	//				scr_text("Saya akan menunggu Anda di sana!", "Roy", 1);
	//				scr_gameText("Ami_hanoi_last");
	//				break;
		
	//	// Roy Flowchart Minigame
	//	case "Roy_flowchart":
	//		scr_text("Selamat datang Player!", "Roy", 1);
	//		scr_text("Sebelum itu, saya jelaskan dulu apa yang Anda akan lakukan!", "Roy", 1);
	//		scr_text("Jadi, Anda akan membantu saya memperbaiki alur flowchart di control panel...", "Roy", 1);
	//		scr_text("Flowchartnya harus sesuai dengan permintaan sistem dan akan dicek juga", "Roy", 1);
	//		scr_text("Semoga Anda bisa memperbaiki alur flowchartnya agar alur kerja dan SOP lounge ini tidak berantakan!", "Roy", 1);
	//		scr_text("Semoga berhasil, Player!", "Roy", 1);
	//		break;
			
	//	// Roy after completing flowchart
	//	case "Roy_post_flowchart":
	//		scr_text("Halo Player!", "Roy", 1);
	//		scr_text("Terima kasih telah membantu saya dalam memperbaiki alur flowchart!", "Roy", 1);
	//		scr_text("Kontribusi Anda sangat berharga bagi kami!", "Roy", 1);
	//		scr_text("Sekarang, hanya tersisa satu permasalahan lagi Player!", "Roy", 1);
	//		scr_text("Untuk permasalahan tersebut, harap ketemu Kak Lylia lagi di Cafe!", "Roy", 1);
	//		scr_text("Sekali lagi, terima kasih atas bantuan Anda dan sampai jumpa!", "Roy", 1);
	//		scr_text("Semoga Anda tetap sukses!", "Roy", 1);
	//		break;
	
	
	//// == MIKE ==
	//	case "Mike_default":
	//		scr_text("Halo Player!", "Mike", 1);
	//		scr_text("Salam kenal, aku Mike", "Mike", 1);
	//		scr_text("Aku karyawan tetap lounge yang bekerja di warehouse!", "Mike", 1);
	//		break;
	
	
	// == STATIC NPC ==
		// Andrun
		case "Andrun_default":
			scr_text("Saya sering ke tempat ini karena saya bisa melihat luar angkasa sambil bekerja di cafe!", "Andrun", 1);
			scr_text("Lihatlah, seberapa megah luar angkasa!", "Andrun", 1);
			scr_text("Sebagai salesman, saya kurang tahu bagaimana angkasa ini bisa tercipta sebagus ini!", "Andrun", 1);
			break;	
		
		// Aisyah & Ali
		case "Aisyah_default":
			scr_text("Alhamdulillah, makanan dan minuman di cafe ini sangat enak!", "Aisyah", 1);
			scr_text("Iya, saya setuju...", "Ali", 1);
			scr_text("Rasa kopi dan martabaknya enak sekali!", "Ali", 1);
			scr_text("Iya, dan kroisannya sangat renyah", "Aisyah", 1);
			scr_text("Kapan-kapan kita ke sini lagi, Ali!", "Aisyah", 1);
			scr_text("Iya, saat kita kembali ke lounge ini!", "Ali", 1);
			break;
			
		case "Ali_default":
			scr_text("Saya tidak pernah berpikir bahwa ternyata ada lounge di luar angkasa", "Ali", 1);
			scr_text("Iya, setahu saya, lounge ini adalah sebuah inisiatif dari rektor Binus untuk memperluas jangkauan kampusnya!", "Aisyah", 1);
			scr_text("Ternayta, beliau tidak hanya memikirkan untuk memperluas jangkauan di bumi saja, tetapi juga sampai ke luar angkasa!", "Ali", 1);
			scr_text("Iya, kita beruntung sekali bisa berada di lounge ini!", "Aisyah", 1);
			scr_text("Iya, dan kita harus juga bersyukur bisa melihat ciptaan Tuhan secara langsung!", "Ali", 1);
			break;
		
		// Rise (Info)
		case "Rise_default":
			scr_text("Halo Player!", "Rise", 1);
			scr_text("Apakah ada yang saya bisa bantu?", "Rise", 1);
			// Input Layer	
				scr_text("?", "Player", -1);
				scr_option("Apa permasalahan yang sekarang dihadapi?", "rise_1");
				scr_option("Beri tahu saya sejarah tempat ini!", "rise_2");
				scr_option("Tidak ada, terima kasih!", "rise_3");
				break;
				
				case "rise_1":
					scr_text("Jadi, ada empat permasalahan utama yang kita sedang hadapi!", "Rise", 1);
					scr_text("Pertama, jukebox di cafe mengalami kerusakan dan perlu diperbaiki!", "Rise", 1);
					scr_text("Kedua, sistem navigasi kita kurang optimal dan perlu diperbaiki di meeting room, ruangan di atas office!", "Rise", 1);
					scr_text("Ketiga, Ami, pengurus logistik lounge, membutuhkan bantuan dalam memindahkan kontainer di storage room, ruangan di atas cafe!", "Rise", 1);
					scr_text("Dan terakhir, menu cafe belum tersortir dengan baik!", "Rise", 1);
					scr_text("Baiklah Player, semoga Anda bisa membantu menyelesaikan permasalahan tersebut!", "Rise", 1);
					scr_text("Jika Anda membutuhkan bantuan lain, Anda bisa bicara ke saya!", "Rise", 1);
					break;
					
				case "rise_2":
					scr_text("Baiklah, saya akan jelaskan sejarah tempat ini!", "Rise", 1);
					scr_text("Tempat ini merupakan hasil dari sebuah ide atau visi rektor Binus dahulu kala!", "Rise", 1);
					scr_text("Awalnya, Binus hanya merupakan universitas yang berada di Jakarta, Indonesia!", "Rise", 1);
					scr_text("Namun, seiring waktu...", "Rise", 1);
					scr_text("Binus berkembang dan melakukan ekspansi ke kota-kota lain di Indonesia, hingga sampai ke luar negeri!", "Rise", 1);
					scr_text("Meskipun perkembangan ini sudah pesat, tetapi hal ini bukan tujuan akhir dari Binus!", "Rise", 1);
					scr_text("Saat itu, rektor Binus mempunyai ide untuk mengembangkan universitas beliau ke luar angkasa!", "Rise", 1);
					scr_text("Awalnya, orang-orang tidak percaya bahwa hal itu akan terjadi...", "Rise", 1);
					scr_text("Tetapi, beliau tetap percaya dengan ide tersebut!", "Rise", 1);
					scr_text("Dengan kerja keras dan usaha, Beliau mampu membuat prototipe lounge pertama...", "Rise", 1);
					scr_text("Namun, prototipe itu gagal evaluasi dan beliau harus bekerja keras lagi!", "Rise", 1);
					scr_text("Prototipenya dikembangkan terus dan beliau belajar dari kesalahannya!", "Rise", 1);
					scr_text("Akhirnya, pada suatu hari, beliau sukses dalam mengembangkan protipe yang berhasil dievaluasi, setelah beberapa kegagalan!", "Rise", 1);
					scr_text("Prototipe tersebut dikembangkan dan dikerjakan turun temurun hingga akhirnya lounge yang sekarang ini bisa diluncurkan ke luar angkasa!", "Rise", 1);
					scr_text("Meskipun beliau tidak lagi bisa melihat lounge ini...", "Rise", 1);
					scr_text("Tetapi saya yakin beliau akan sangat bangga dengan ciptaannya!", "Rise", 1);
					scr_text("Dan itulah sejarah dari lounge ini hingga sekarang!", "Rise", 1);
							
				case "rise_3":
					scr_text("Baiklah Player!", "Rise", 1);
					scr_text("Jika Anda membutuhkan bantuan lain, Anda bisa bicara ke saya lagi!", "Rise", 1);
					break;
		
		// Staf Cafe (Order minuman atau makanan)
		case "stafCafe_default":
			scr_text("Halo Player!", "sCafe", 1);
			scr_text("Apa yang ingin Anda pesan?", "sCafe", 1);
			// Input Layer	
				scr_text("?", "Player", -1);
				scr_option("Saya ingin pesan makanan!", "cafe_1");
				scr_option("Saya ingin pesan minuman!", "cafe_2");
				scr_option("Maaf, saya tidak jadi pesan!", "cafe_3");
				break;
				
				case "cafe_1":
					scr_text("Baik, makanan apa yang ingin anda pesan?", "sCafe", 1);
					// Input Layer	
					scr_text("?", "Player", -1);
					scr_option("Kroisan coklat", "cafe_1a");
					scr_option("Telur orak-arik", "cafe_1b");
					scr_option("Martabak", "cafe_1c");
					break;
					
						case "cafe_1a":
						scr_text("Hmm, Makanan pilihan orang Prancis, atau mereka sebutnya 'pain au chocolat'!", "sCafe", 1);
						scr_text("Baik Player, ini kroisan coklatnya!", "sCafe", 1);
						scr_text("~ Saya mendapatkan kroisan coklat! ~");
						scr_gameText("order_cont");
						break;
					
						case "cafe_1b":
						scr_text("Hmm, salah satu dari beberapa jenis hidangan telur yang ada!", "sCafe", 1);
						scr_text("Baik Player, ini telur orak-ariknya!", "sCafe", 1);
						scr_text("~ Saya mendapatkan telur orak-arik! ~");
						scr_gameText("order_cont");
						break;
					
						case "cafe_1c":
						scr_text("Hmm, makanan yang disukai banyak orang Asia!", "sCafe", 1);
						scr_text("Baik Player, ini martabaknya", "sCafe", 1);
						scr_text("~ Saya mendapatkan martabak! ~");
						scr_gameText("order_cont");
						break;
					
				case "cafe_2":
					scr_text("Baik, minuman apa yang ingin anda pesan?", "sCafe", 1);
					// Input Layer	
					scr_text("?", "Player", -1);
					scr_option("Cappucino", "cafe_2a");
					scr_option("Teh hijau", "cafe_2b");
					scr_option("Susu kocok", "cafe_2c");
					break;
					
						case "cafe_2a":
						scr_text("Hmm, sebuah kopi dengan aroma yang kuat dan harum sekali!", "sCafe", 1);
						scr_text("Baik Player, ini cappucinonya!", "sCafe", 1);
						scr_text("~ Saya mendapatkan cappucino! ~");
						scr_gameText("order_cont");
						break;
					
						case "cafe_2b":
						scr_text("Hmm, pilihan yang bijak untuk kesehatan Anda!", "sCafe", 1);
						scr_text("Baik Player, ini telur teh hijaunya!", "sCafe", 1);
						scr_text("~ Saya mendapatkan teh hijau! ~");
						scr_gameText("order_cont");
						break;
					
						case "cafe_2c":
						scr_text("Hmm, minuman yang mengabungkan aspek susu, es krim, dan sirop menjadi satu!", "sCafe", 1);
						scr_text("Baik Player, ini susu kocoknya", "sCafe", 1);
						scr_text("~ Saya mendapatkan susu kocok! ~");
						scr_gameText("order_cont");
						break;
					
					
				case "cafe_3":
					scr_text("Baik Player!", "sCafe", 1);
					scr_text("Anda bisa kembali lagi untuk memesan!", "sCafe", 1);
					break;
					
				case "cafe_4":
					scr_text("Baik Player!", "sCafe", 1);
					scr_text("Selamat menikmati!", "sCafe", 1);
					break;
		
			case "order_cont":
				scr_text("Baik Player, apakah Anda mau tambah?", "sCafe", 1);
				// Input Layer	
					scr_text("?", "Player", -1);
					scr_option("Iya, saya ingin pesan makanan!", "cafe_1");
					scr_option("Iya, saya ingin pesan minuman!", "cafe_2");
					scr_option("Tidak ada lagi, terima kasih!", "cafe_4");
					break;
			
			
		// Reynomn
		case "Reynomn_default":
			scr_text("Huh, saya masih ada kerjaan yang belum selesai!", "Reynomn", 1);
			scr_text("Saya harus cetak laporan ini untuk Supervisor saya!", "Reynomn", 1);
			scr_text("Kalau boleh jujur, saya sedikit malas untuk mengerjakan tugas ini...", "Reynomn", 1);
			scr_text("Tetapi, bagaimana lagi?", "Reynomn", 1);
			scr_text("Saya tidak ada pilihan lagi selain menyelesaikan tugas yang diberikan!", "Reynomn", 1)
			break;
		
		
		// Graph Minigame Dialogue
		case "Supervisor_default":
			scr_text("Player, untuk memulai tugasnya...", "Supervisor", 1);
			scr_text("Silakan menyalakan panel tengah ini!", "Supervisor", 1);
			scr_text("Semoga Anda sukses dalam tugas Anda!", "Supervisor", 1);
			break;
			
		case "Gregory_default":
			scr_text("Halo Player!", "Gregory", 1);
			scr_text("Silakan menyalakan panel di sebelah saya untuk memulai tugas Anda!", "Gregory", 1);
			scr_text("Semoga Anda berhasil dalam menyelesaikan tugasnya!", "Gregory", 1);
			scr_text("Ingatlah untuk selalu disiplin dan teliti saat mengerjakan sesuatu!", "Gregory", 1);
			break;
			
		
		// Arcade
		case "Yuna_default":
			scr_text("Halo, kamu mesti Player bukan?", "Yuna", 1);
			scr_text("Baik, salam kenal Player!", "Yuna", 1);
			scr_text("Saya Yuna, bersama dengan kakak saya, kami adalah pemilik arcade!", "Yuna", 1);
			scr_text("Arcadenya berada di dekat cafe, di ruangan paling bawah!", "Yuna", 1);
			scr_text("Di sana, kamu bisa memainkan game-game seru yang saya jamin bikin kamu betah!", "Yuna", 1);
			scr_text("Ok, kalau kamu sudah siap, kamu bisa masuk ke ruang Arcade!", "Yuna", 1);
			scr_text("Dan satu hal lagi, berikan salam ke kakak saya, Yuri; dan Bernard, teknisi arcadenya!", "Yuna", 1);
			break;
			
		case "Yuri_default":
			scr_text("Halo Player!", "Yuri", 1);
			scr_text("Yuna sudah memberi tahu kamu tentang tempat ini ya?", "Yuri", 1);
			scr_text("Ok, jadi selamat datang di arcade!", "Yuri", 1);
			scr_text("Arcade ini merupakan tempat bagi orang untuk memainkan game-game seru!", "Yuri", 1);
			scr_text("Nah, berdasarkan permasalahan yang kamu sudah selesaikan...", "Yuri", 1);
			scr_text("Saya dan Bernard berpikir untuk membuat game-game penyelesaian permasalahan tersebut!", "Yuri", 1);
			scr_text("Kami berpikir dengan membuat game-game ini, kamu bisa mengasah kemampuan kamu lagi...", "Yuri", 1);
			scr_text("Sehingga kamu mampu menyelesaikan permasalahan dengan lebih cepat dan efisien!", "Yuri", 1);
			scr_text("Ok Player, selamat bermain dan semoga kamu suka gamenya!", "Yuri", 1);
			break;
			
		case "Bernard_default":
			scr_text("Halo!", "Bernard", 1);
			scr_text("Saya Bernard, seorang teknisi arcade ini!", "Bernard", 1);
			scr_text("Yuri dan Yuna memanggil saya karena saya lulusan teknik elektro dan saya suka main game!", "Bernard", 1);
			scr_text("Kebetulan atau tidak? saya kurang tahu!", "Bernard", 1);
			scr_text("Jadi, selamat bermain game-game yang kami buat untukmu, Player!", "Bernard", 1);
			break;
			
	}
}