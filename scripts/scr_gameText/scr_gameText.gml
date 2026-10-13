// Tutorial by Peyton Burnham
// Branching Dialog System with Effects in GMS 2! (Part 2: Branching Dialog)
// https://www.youtube.com/watch?v=6Bzj7GdSkJI

/// @param text_id
function scr_gameText(_text_id){
	
	// 🔥 Ambil nama dari input form, jika kosong gunakan default "Player"
	var _p = (variable_global_exists("player_name") && global.player_name != "") ? global.player_name : "Player";

	switch(_text_id){
	
	// == CHECK IN & SECURITY ROOM CUTSCENES ==
		case "Adhoc - intro":
			scr_text("Selamat datang!", "Security Officer");
			scr_text("Bolehkah saya cek identitas Anda?", "Security Officer");
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
			scr_text("Halo " + _p + "!", "Lylia", 1);
			scr_text("Senang bertemu denganmu!", "Lylia", 1);
			break;
			
		// Lylia Intro Cutscene
		case "Lylia_intro":
			scr_text("Halo, Selamat datang di Binusian Space Lounge!", "Lylia", 1);
			scr_text("Perkenalkan nama saya Lylia, saya adalah pengurus tempat ini!", "Lylia", 1);
			scr_text("Kamu adalah " + _p + " bukan?", "Lylia", 1);
			scr_text("?", _p, -1);
			scr_option("Iya, saya " + _p, "intro_1");
			scr_option("Siapa?", "intro_2");
			break;
	
				case "intro_1":
					scr_text("Baik, senang bertemu denganmu, " + _p + "!", "Lylia", 1);
					scr_gameText("Lylia_intro_cont");
					break;
		
				case "intro_2":
					scr_text("Hahaha. Iya, itu kamu, " + _p + "!", "Lylia", 1);
					scr_text("Senang bertemu denganmu!", "Lylia", 1);
					scr_gameText("Lylia_intro_cont");
					break;
			
			case "Lylia_intro_cont":
				scr_text("Ok " + _p + ", kamu pasti belum familiar dengan tempat ini dan mengapa kamu ditugaskan disini!", "Lylia", 1)
				scr_text("Saya jelaskan!", "Lylia", 1);
				scr_text("Tempat ini adalah Binusian Space Lounge!", "Lylia", 1);
				scr_text("Tempat berkumpul mahasiswa dan karyawan BINUS di luar angkasa!", "Lylia", 1);
				scr_text("Iya, tempat ini beneran di luar angkasa", "Lylia", 1);
			
				scr_text("Tempat ini sudah berjalan lancar selama beberapa bulan...", "Lylia", 1);
				scr_text("Tetapi belakangan ini, mulai muncul beberapa masalah!", "Lylia", 1);
				scr_text("Seperti jukebox yang rusak, data arsip yang belum terorganisir, dan lain-lain...", "Lylia", 1);
			
				scr_text("Intinya, saya ingin kamu untuk membantu kami menyelesaikan masalah-masalah tersebut!", "Lylia", 1);
				scr_text("?", _p, -1);
				scr_option("Kenapa harus saya?", "intro_3");
				scr_option("Kenapa tidak orang lain yang membantu?", "intro_4")
				break;
						
					case "intro_3":
						scr_text(_p + ", saya memanggil kamu karena kamu adalah orang yang terbaik untuk menyelesaikan masalah-masalah di sini!", "Lylia", 1);
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
				scr_text("Jadi, kamu akan menyelesaikan masalah-masalah di beberapa ruangan di lounge ini!", "Lylia", 1);
				scr_text("Tidak apa-apa, kamu tidak harus menyelesaikan masalah tersebut secepatnya!", "Lylia", 1);
				scr_text("Kamu bisa keliling lounge terlebih dahulu untuk memperkenalkan diri!", "Lylia", 1);
				
				scr_text("Untuk masalah pertama, saya anjurkan kamu untuk memperbaiki jukebox di Cafe!", "Lylia", 1);
				scr_text("Jukeboxnya mengalami masalah kelistrikan yang menyebabkannya tidak berjalan!", "Lylia", 1);
				scr_text("Berdasarkan manualnya, jukebox bisa diperbaiki dengan memperbaiki gerbang logika di rangkaian listriknya!", "Lylia", 1);
				
				scr_text("Ok " + _p + ", semoga sukses dalam tugasnya!", "Lylia", 1);
				scr_text("Jika kamu membutuhkan bantuan, kamu bisa bicara ke saya!", "Lylia", 1);
				scr_text("Kamu bisa menemui saya di Cafe!", "Lylia", 1);
				
				// 🔥 PENTING: Pengaman agar cutscene tidak berantakan / macet
				obj_cutscene.introCompleted = true;
				break;
			
		
		// Lylia Logic Gate Intro
		case "Lylia_post_intro":
			scr_text("Halo " + _p + "!", "Lylia", 1);
			scr_text("Apakah kamu ada kesulitan dalam memperbaiki jukeboxnya?", "Lylia", 1);
			scr_text("?", _p, -1);
			scr_option("Saya butuh bantuan!", "jb_1");
			scr_option("Tidak ada, terima kasih", "jb_2")
			break;
				
				case "jb_1":
					scr_text("Ah, sepertinya kamu kurang paham mengenai gerbang logika!", "Lylia", 1);
					scr_text("Saya akan jelaskan dengan mudah!", "Lylia", 1);
					scr_text("Jadi, tugasmu adalah menyalakan lampu dengan menekan sakelar atau input yang disesuaikan dengan kondisi gerbang logika sebagai output agar arus di kabel bisa mengalir ke lampu!", "Lylia", 1);
					scr_text("Gerbang logikanya terdiri dari: OR, AND, NOT, NOR, dan NAND!", "Lylia", 1);
					scr_text("Gerbang logika OR akan memberi output jika ada salah satu atau semua input", "Lylia", 1);
					scr_text("Gerbang logika AND hanya akan memberi output jika ada semua input", "Lylia", 1);
					scr_text("Gerbang logika NOT akan membalikkan input yang ada", "Lylia", 1);
					scr_text("Gerbang logika NOR adalah kebalikan OR dan akan memberi output jika tidak ada input sama sekali", "Lylia", 1);
					scr_text("Dan gerbang logika NAND adalah kebalikan AND dan tidak akan memberi output jika ada kedua input!", "Lylia", 1);
					scr_text("Ok " + _p + ", semoga kamu mengerti penjelasanku!", "Lylia", 1);
					scr_text("Dengan itu, kamu bisa kembali ke jukebox untuk memperbaikinya!", "Lylia", 1);
					scr_text("Saya akan menunggu di Cafe setelah kamu selesai memperbaiki jukeboxnya!", "Lylia", 1);
					break;
					
				case "jb_2":
					scr_text("Ok " + _p, "Lylia", 1);
					scr_text("Saya akan menunggu di Cafe setelah kamu selesai memperbaiki jukeboxnya!", "Lylia", 1);
					break;
			
		// Lylia after completing logic gate
		case "Lylia_post_logic":
			scr_text("Halo " + _p + "!", "Lylia", 1);
			scr_text("Terima kasih telah memperbaiki jukeboxnya!", "Lylia", 1);
			scr_text("Bagaimana? Apakah tugas tersebut susah?", "Lylia", 1);
			scr_text("?", _p, -1);
			scr_option("Gampang sekali!", "jb_3");
			scr_option("Tadi sedikit susah!", "jb_4")
			break;
			
				case "jb_3":
					scr_text("Wow, kamu memang orang hebat!", "Lylia", 1);
					scr_text("Gerbang logika memerlukan pemikiran logika yang baik, dan kamu sanggup menyelesaikannya dengan mudah!", "Lylia", 1);
					scr_text("Keren sekali, " + _p + "!", "Lylia", 1);
					scr_gameText("Lylia_post_logic_cont");
					break;
					
				case "jb_4":
					scr_text("Tidak apa-apa " + _p + ", yang penting kamu sudah berusaha!", "Lylia", 1);
					scr_text("Dan berkat kamu, jukeboxnya mampu dibenarkan dan pengalaman pengunjung akan meningkat!", "Lylia", 1);
					scr_text("Keren, " + _p + "!", "Lylia", 1)
					scr_gameText("Lylia_post_logic_cont");
					break;
			
		case "Lylia_post_logic_cont":
			scr_text("Karena kamu sudah memperbaiki jukebox...", "Lylia", 1);
			scr_text("Selanjutnya, kamu bisa pergi ke Office dan memeriksa ruang Archive di sebelah sana!", "Lylia", 1);
			scr_text("Di sana, Adhila akan membantumu melihat data laporan penting lounge kita!", "Lylia", 1);
			scr_text(_p + ", jika kamu butuh istirahat terlebih dahulu, kamu bisa duduk sebentar di cafe! Ok!", "Lylia", 1);
			scr_text("Luangkan waktu kamu " + _p + "!", "Lylia", 1);
			break;
			
		// Lylia after completing archive inspection
		case "Lylia_post_graph":
			scr_text("Halo " + _p + "!", "Lylia", 1);
			scr_text("Terima kasih telah merapikan dan memeriksa data di ruang Archive!", "Lylia", 1);
			scr_text("Aku punya perasaan bahwa kamu bisa melakukannya dengan sangat baik!", "Lylia", 1);
			scr_text("Untuk permasalahan selanjutnya, harap pergi ke Storage Room yang berada di atas Cafe!", "Lylia", 1);
			scr_text("Semoga sukses dan luangkan waktumu " + _p + "!", "Lylia", 1);
			break;
		
		// Lylia Sorting Intro
		case "Lylia_sorting_intro":
			scr_text("Halo " + _p + "!", "Lylia", 1);
			scr_text("Sepertinya kamu sudah membantu Ami dalam memindahkan kontainer", "Lylia", 1);
			scr_text("Terima kasih " + _p + " atas bantuan kamu!", "Lylia", 1);
			scr_text("Ami sangat merindukan bantuan kamu, " + _p, "Lylia", 1);
			scr_text("Dan sebagai temannya, saya sangat bangga dengan kamu!", "Lylia", 1);
			scr_text("Dengan itu, hanya tersisa satu permasalahan lagi " + _p + "!", "Lylia", 1);
			scr_text("Untuk permasalahan terakhir ini...", "Lylia", 1);
			scr_text("Permasalahan ini tidak susah, tetapi sangat repetitif jika dilakukan berulang kali!", "Lylia", 1);
			scr_text("Jadi setiap hari di Cafe, saya dan staf harus menyortir semua menu cafe dan pesanan pelanggan!", "Lylia", 1);
			scr_text("Untuk itu, saya minta kamu untuk membantu sortir menu cafe sesuai kebutuhan pelanggan agar kepuasan mereka meningkat!", "Lylia", 1);
			scr_text("Ok " + _p + ", tidak apa-apa kalau kamu ingin istirahat di sini terlebih dahulu!", "Lylia", 1);
			scr_text("Jika kamu sudah siap, kamu bisa bicara ke saya, Ok!", "Lylia", 1);
			break;
		
		// Lylia Sorting Minigame
		case "Lylia_sorting":
			scr_text("Halo " + _p + "!", "Lylia", 1);
			scr_text("Apakah kamu sudah siap?", "Lylia", 1);
			scr_text("?", _p, -1);
			scr_option("Iya!", "sort_1");
			scr_option("Saya belum siap!", "sort_2")
			break;
			
				case "sort_1":
					scr_text("Ok " + _p + ", itulah yang saya ingin dengar!", "Lylia", 1);
					scr_text("Kalau begitu, marilah kita mulai!", "Lylia", 1);
					scr_text("~ Saya akan bantu Lylia menyortir menu cafe ~");
					break;
					
				case "sort_2":
					scr_text("Tidak apa-apa " + _p + "!", "Lylia", 1);
					scr_text("Bicara ke saya lagi kalau kamu sudah siap!", "Lylia", 1);
					scr_text("Ambil waktumu " + _p + "!", "Lylia", 1);
					break;
		
		// Lylia after completing sorting
		case "Lylia_sorting_outro":
			scr_text("Kamu keliling, kamu bantu, dan kamu mempunyai jiwa yang baik...", "Lylia", 1);
			scr_text("Kadang kontribusi tidak harus besar. Yang besar sering lahir dari yang teguh dan konsisten.", "Lylia", 1);
			scr_text("...", _p, -1);
			scr_text("Oh, Halo " + _p + "!", "Lylia", 1);
			scr_text("Maaf tadi saya memikirkan tentang suatu puisi untukmu!", "Lylia", 1);
			scr_text("...", "Lylia", 1);
			scr_text(_p + ", Terima kasih atas semua bantuan dan kontribusi kamu di lounge!", "Lylia", 1);
			scr_text("Semua bantuan dan kontribusi kamu sangat berharga bagi saya, mahasiswa, dan staf di sini!", "Lylia", 1);
			scr_text("Sebagai apresiasi atas kerja kamu, saya memberikan kunci untuk ruang arcade di sebelah Cafe yang paling bawah!", "Lylia", 1);
			scr_text("Kamu bisa memainkan ulang minigame yang sudah kamu selesaikan!", "Lylia", 1);
			scr_text("?", _p, -1);
			scr_option("Baik, aku coba main kembali!", "arcade_1");
			scr_option("Aku senang pernah jadi bagian dari suasana ini!", "arcade_2");
			break;
			
				case "arcade_1":
					scr_text("Ok " + _p + ", selamat bermain!", "Lylia", 1);
					break;
					
				case "arcade_2":
					scr_text("Iya, saya juga senang sekali punya suasana dengan kamu", "Lylia", 1);
					break;
			
		// Lylia Game Outro
		case "Lylia_game_outro":
			scr_text(_p + "...", "Lylia", 1);
			scr_text("Pekerjaan kamu di sini sudah selesai...", "Lylia", 1);
			scr_text("Jika kamu ingin pergi ke tempat lain, saya tidak akan menghalangimu!", "Lylia", 1);
			scr_text("Kamu bisa ke tempat boarding yang berada di sebelah waiting room...", "Lylia", 1);
			scr_text("Tetapi, jika kamu ingin tetap di sini, saya berterima kasih sekali lagi!", "Lylia", 1);
			scr_text("Tanpamu, tempat ini tidak akan sebaik sekarang!", "Lylia", 1);
			scr_text("Pilihannya di tangan kamu, " + _p + "!", "Lylia", 1);
			break;
			
		
	// == ADHILA ==
		case "Adhila_default":
			scr_text("Hai " + _p + "!", "Adhila", 1);
			scr_text("Nama aku Adhila!", "Adhila", 1);
			scr_text("Aku mahasiswa BINUS yang sekarang lagi magang di lounge ini!", "Adhila", 1);
			scr_text("Salam kenal!", "Adhila", 1);
			break;
		
		// Adhila Intro Cutscene
		case "Adhila_intro":
			scr_text("Hai " + _p + "!", "Adhila", 1);
			scr_text("Aku dengar kamu sudah memperbaiki jukebox...", "Adhila", 1);
			scr_text("Itu benar kan?", "Adhila", 1);
			scr_text("?", _p, -1);
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
					scr_text("Haha jangan berbohong " + _p + "!", "Adhila", 1);
					scr_text("Aku sudah tahu kamu yang memperbaiknya karena Kak Lylia bilang ke aku lewat telepon!", "Adhila", 1);
					scr_text("Jadi, terima kasih sudah memperbaikinya!", "Adhila", 1);
					scr_text("Karena kamu, cafenya tidak lagi membosankan karena sekarang sudah ada musik lagi!", "Adhila", 1);
					scr_gameText("Adhila_intro_cont");
					break;
					
				case "adhila_intro_3":
					scr_text("Wah, benarkah?", "Adhila", 1);
					scr_text("Terakhir kali aku cek, jukeboxnya rusak...", "Adhila", 1);
					scr_text("Kok tiba-tiba jadi benar dengan sendirinya?", "Adhila", 1);
					scr_text("Hmmm..., sepertinya ada sesuatu atau seseorang yang memperbaikinya!", "Adhila", 1);
					
					scr_text(_p, "Adhila", 1);
					scr_text("Apakah kamu setuju kalau jukebox, sebuah benda mati, bisa memperbaikinya sendiri?", "Adhila", 1);
					scr_text("?", _p, -1);
					scr_option("Iya...", "adhila_intro_4");
					scr_option("...", "adhila_intro_5")
					break;
					
						case "adhila_intro_4":
							scr_text("Kok kamu kelihatan tidak yakin?", "Adhila", 1);
							scr_text("Heh, aku sudah tahu kalau kamu memperbaikinya, " + _p + "!", "Adhila", 1);
							scr_text("Karena Kak Lylia sudah memberi tahu saya lewat telepon!", "Adhila", 1);
							scr_text("Jadi, terima kasih ya sudah memperbaikinya!", "Adhila", 1);
							scr_gameText("Adhila_intro_cont");
						break;
					
						case "adhila_intro_5":
							scr_text("Hmm, kamu tidak tahu kah?", "Adhila", 1);
							scr_text("Heh, aku sudah duga kalau kamu yang memperbaiknya!", "Adhila", 1);
							scr_text("Karena Kak Lylia sudah memberi tahu saya lewat telepon!", "Adhila", 1);
							scr_text("Jadi, terima kasih sudah memperbaikinya!", "Adhila", 1);
							scr_gameText("Adhila_intro_cont");
						break;
					
			case "Adhila_intro_cont":
    // Tandai bahwa cutscene intro ini sudah tamat, jadi kalau diajak ngobrol lagi nanti larinya ke post-intro/menu
    global.played_cutscenes[$ "adhila_intro_scene"] = true;
    
    update_quest_step_universal("md_orientasi", 1);
   
				
				scr_text("Ok, jadi untuk permasalahan sekarang...", "Adhila", 1);
				scr_text("Permasalahan ini mengenai pengecekan data di ruang Archive kita!", "Adhila", 1);
				scr_text("Arsip laporan data administrasi dan inventaris kita perlu ditinjau kembali...", "Adhila", 1);
				scr_text("Ini penting agar koordinasi dan rekapitulasi data tidak mengalami keterlambatan...", "Adhila", 1);
				scr_text("Untuk menyelesaikan masalah ini, aku ingin kamu membantu memeriksa data di ruang Archive!", "Adhila", 1);
				scr_text("Ok " + _p + ", kamu bisa langsung masuk ke ruang Archive di belakang pintu ini untuk memulainya!", "Adhila", 1);
				scr_text("Semoga sukses " + _p + "!", "Adhila", 1);
				
				// 🔥 Berikan opsi tambahan agar pemain bisa langsung ngobrol/membahas easter egg setelah intro selesai
				scr_option("Mau ngobrol-ngobrol dulu sama Adhila", "buka_menu_adhila");
				scr_option("Baiklah, aku mau lanjut masuk Archive!", "close");
				break;
		
		case "Adhila_post_intro":
			scr_text("Hai " + _p + "!", "Adhila", 1);
			scr_text("Kamu boleh masuk ke ruang Archive di belakang pintu untuk memeriksa data laporan!", "Adhila", 1);
			scr_text("Tidak harus cepat selesainya, kamu bisa ke kafe dulu kalau kamu butuh istirahat", "Adhila", 1);
			scr_text("Dan jika nanti kamu kesusahan memeriksa datanya, kamu bisa tanya ke staf yang bertugas!", "Adhila", 1);
			scr_text("Ok " + _p + ", semoga sukses!", "Adhila", 1);
			scr_option("Mau ngobrol-ngobrol dulu sama Adhila", "buka_menu_adhila");
			scr_option("Makasih infonya, aku mau lanjut jalan!", "close");
			break;

		case "buka_menu_adhila":
			scr_text("Ada yang ingin kamu tanyakan, " + _p + "?", "Adhila", 1);
			scr_option("Tentang Bekeners...", "adhila_easter_egg");
			scr_option("Tidak ada lagi", "close");
			break;

		case "adhila_easter_egg":
			scr_text("Oh, kamu menemukan sesuatu yang aneh ya?", "Adhila", 1);
			scr_text("Bekeners adalah rahasia kecil yang kusembunyikan di lounge ini.", "Adhila", 1);
			scr_text("Kalau kamu bisa mengumpulkan ketujuh Bekeners, mungkin ada kejutan untukmu!", "Adhila", 1);
			scr_option("Aku akan mencarinya!", "close");
			break;

		
		// Adhila after completing archive check
		case "Adhila_post_graph":
			update_quest_step_universal("md_orientasi", 2);

			scr_text("Hai " + _p + "!", "Adhila", 1);
			scr_text("Terima kasih ya, sudah memeriksa data di ruang Archive kita!", "Adhila", 1);
			scr_text("Dengan bantuanmu, rekapitulasi data laporan menjadi jauh lebih rapi dan terorganisir.", "Adhila", 1);
			scr_text("Untuk permasalahan di lounge, masih ada beberapa lagi!", "Adhila", 1);
			scr_text("Aku dengar kalau di Storage Room, Ami sedang mengalami permasalahan logistik...", "Adhila", 1);
			scr_text("Aku yakin kamu bisa membantu menyelesaikan permasalahan-permasalahan tersebut!", "Adhila", 1);
			
			// 🔥 Menu obrolan & Easter Egg Bekeners tetap bisa diakses
			scr_option("Ada beberapa hal yang ingin kutanyakan lagi...", "buka_menu_adhila");
			scr_option("Baiklah, aku akan lanjut selesaikan yang lain!", "close");
			break;

	
	// == AMI ==
		case "Ami_default":
			scr_text("Hei " + _p + "!", "Ami", 1);
			scr_text("Namaku Ami", "Ami", 1);
			scr_text("Aku pengurus bagian logistik lounge ini!", "Ami", 1);
			break;
			
		// Ami and Lylia Cutscene
		case "Ami_intro":
			scr_text("Halo Ami, apakah kamu masih mengalami permasalahan di Storage Room?", "Lylia", 1);
			scr_text("Iya Lia, tetap ada masalah itu lagi...", "Ami", 1);
			scr_text("Proses logistik kita itu kurang efisien, Lia", "Ami", 1);
			scr_text("Kita sering mengirim barang ke planet lain, tetapi prosesnya sedikit lama dan tidak efisien!", "Ami", 1);
			scr_text("Dan ketika menerima barang, aku tidak mampu menyortir semuanya sendirian!", "Ami", 1);
			scr_text("Aku tidak tahu harus apa lagi, Lia...", "Ami", 1);
			scr_text("Aku sudah bekerja sekeras mungkin dan sering capai memikirkan hal ini!", "Ami", 1);
			scr_text("Wah, maaf sekali Ami, saya tidak tahu kamu harus bekerja sekeras ini!", "Lylia", 1);
			scr_text("Apakah yang saya bisa lakukan untuk membantumu?", "Lylia", 1);
			scr_text("Aku butuh pekerja lagi, Lia, dan aku tidak tahu siapa yang bisa membantu!", "Ami", 1);
			scr_text("Hmm, kalau saya boleh memberi rekomendasi...", "Lylia", 1);
			scr_text("Saya rekomendasikan kamu untuk merekrut " + _p + " untuk membantumu!", "Lylia", 1);
			scr_text(_p + " kah, orang yang memperbaiki jukebox bukan? kenapa kamu rekomendasikan dia?", "Ami", 1);
			scr_text("Bagaimana " + _p + " bisa membantu menyelesaikan masalah saya?", "Ami", 1);
			scr_text("Iya, dia itu yang memperbaiki jukeboxnya, dia juga barusan merapikan data arsip di ruang Archive!", "Lylia", 1);
			scr_text("Dan karena permasalahan kamu itu mirip dengan yang sudah diselesaikannya...", "Lylia", 1);
			scr_text("Saya yakin " + _p + " akan bisa membantu permasalahanmu dengan baik!", "Lylia", 1);
			scr_text("Menyelesaikan masalah-masalah tersebut tidak gampang dan memerlukan ketelitian yang baik!", "Lylia", 1);
			scr_text("Hmm...", "Ami", 1);
			scr_text("Ok Lia, aku percaya kamu!", "Ami", 1);
			scr_text("Terima kasih Lia untuk sarannya!", "Ami", 1);
			scr_text("Tidak apa-apa Ami!", "Lylia", 1);
			scr_text("Lia itu " + _p + " bukan?", "Ami", 1);
			scr_gameText("Ami_intro_cont");
			break;
			
		case "Ami_intro_cont":
			scr_text("Halo " + _p + "!, ini Ami, pengurus logistik lounge!", "Lylia", 1);
			scr_text("Dia bekerja di Storage Room, ruangan di atas Cafe!", "Lylia", 1);
			scr_text("Apakah kamu sudah mengenal Ami?", "Lylia", 1);
			scr_text("?", _p, -1);
			scr_option("Iya, saya tadi kenalan dengan Ami", "ami_intro_1");
			scr_option("Saya belum terlalu mengenal Ami!", "ami_intro_2");
			break;
					
					case "ami_intro_1":
						scr_text("Iya, tadi " + _p + " bertemu dengan saya!", "Ami", 1);
						scr_text("Wow, bagus sekali kalian sudah kenalan!", "Lylia", 1);
						scr_text("Kata Lylia, kamu adalah orang yang cocok untuk menyelesaikan permasalahan saya!", "Ami", 1);
						scr_text("Iya betul, jadi Ami mempunyai masalah logistik yang perlu diselesaikan!", "Lylia", 1);
						scr_text("Iya nanti ketemu aku di Storage Room untuk menjelaskan lebih lanjut!", "Ami", 1);
						scr_text(_p + ", aku harus kembali kerja terlebih dahulu, sampai jumpa di sana!", "Ami", 1);
						scr_gameText("Ami_intro_last");
						break;
					
					case "ami_intro_2":
						scr_text("Ok " + _p + ", namaku Ami, salam kenal!", "Ami", 1);
						scr_text("Kata Lylia, kamu adalah orang yang cocok untuk menyelesaikan permasalahan saya!", "Ami", 1);
						scr_text("Iya betul, jadi Ami mempunyai masalah logistik yang perlu diselesaikan!", "Lylia", 1);
						scr_text("Iya nanti ketemu aku di Storage Room untuk menjelaskan lebih lanjut!", "Ami", 1);
						scr_text(_p + ", aku harus kembali kerja terlebih dahulu, sampai jumpa di sana!", "Ami", 1);
						scr_gameText("Ami_intro_last");
						break;
						
			case "Ami_intro_last":
				scr_text(_p + ", aku harap kamu bisa membantu Ami menyelesaikan masalahnya!", "Lylia", 1);
				break;
			
		// Ami Hanoi Intro
		case "Ami_hanoi_intro":
			scr_text("Hei " + _p + "!", "Ami", 1);
			scr_text("kita ketemu lagi!", "Ami", 1);
			scr_text("Tanpa basa-basi, aku akan jelaskan apa yang harus kamu lakukan!", "Ami", 1);
			scr_text("Jadi, kamu membantu saya memindahkan kontainer-kontainer yang tertumpuk ke conveyor belt untuk dikirim!", "Ami", 1);
			scr_text("Sayangnya karena tempat ini terbatas dan kontainernya berat, kamu harus memindahkannya dengan cara tertentu!", "Ami", 1);
			scr_text("?", _p, -1);
			scr_option("Cara tertentu?", "ami_hanoi_1");
			scr_option("Apakah caranya mirip dengan Tower of Hanoi?", "ami_hanoi_2")
			break;
					
				case "ami_hanoi_1":
					scr_text("Maaf, aku kira kamu sudah tahu...", "Ami", 1);
					scr_text("Kamu bisa menggunakan cara Tower of Hanoi", "Ami", 1);
					scr_text("Kita menggunakan cara ini karena efisien dan klannya tidak bisa memindahkan tumpukan kontainer sekaligus!", "Ami", 1);
					scr_text("Untuk cara kerjanya, kamu hanya bisa memindahkan kontainer satu per satu dan tidak boleh menempatkan kontainer yang lebih besar di atas yang lebih kecil!", "Ami", 1);
					scr_text("Untuk ini, kamu harus hati-hati menempatkan kontainernya!", "Ami", 1);
					scr_text("Karena hanya ada 3 tempat saja!", "Ami", 1);
					scr_text(_p + ", tidak apa-apa kalau kamu membuat kesalahan!", "Ami", 1);
					scr_text("Kadang saya juga melakukan kesalahan!", "Ami", 1);
					scr_gameText("Ami_hanoi_last")
					break;
					
				case "ami_hanoi_2":
					scr_text("Benar " + _p + "!", "Ami", 1);
					scr_text("Kalau begitu, apakah kamu sudah tahu cara kerja Tower of Hanoi?", "Ami", 1);
					scr_text("?", _p, -1);
					scr_option("Iya, saya sudah tahu caranya!", "ami_hanoi_3");
					scr_option("Saya belum terlalu tahu!", "ami_hanoi_1")
					break;
							
					case "ami_hanoi_3":
						scr_text("Bagus sekali " + _p + "!", "Ami", 1);
						scr_gameText("Ami_hanoi_last")
						break;
						
			case "Ami_hanoi_last":
				scr_text("Ok " + _p + ", karena kamu sudah tahu cara kerjanya!", "Ami", 1);
				scr_text("Kamu bisa menggunakan control panel di sebelah saya untuk mengoperasikan alat pengangkut untuk memindahkan kontainernya!", "Ami", 1);
				scr_text("Ingat, hanya satu kontainer setiap kali pindah!", "Ami", 1);
				scr_text("Dan " + _p + ", karena proses ini menguras waktu...", "Ami", 1);
				scr_text("Kamu bisa memilih 2 dari 3 tumpukan kontainer untuk dipindahkan!", "Ami", 1);
				scr_text("Atau kamu bisa menyelesaikan ketiga-tiganya jika tidak keberatan!", "Ami", 1);
				scr_text("Semoga kamu bisa menyelesaikannya, " + _p + "!", "Ami", 1);
				break;
		
		// Ami pre-hanoi
		case "Ami_pre_hanoi":
			scr_text("Hei " + _p + "!", "Ami", 1);
			scr_text("Semoga kamu bisa membantu saya memindahkan kontainernya!", "Ami", 1);
			scr_text("Kamu bisa membantu memindahkan 2 dari 3 tumpukan kontainer!", "Ami", 1);
			scr_text("Atau selesaikan ketiga-tiganya jika kamu tidak keberatan!", "Ami", 1);
			scr_text("Saya bakal senang sekali jika kamu melakukannya!", "Ami", 1);
			break;
			
		// Ami post-hanoi
		case "Ami_post_hanoi":
			scr_text("Hei " + _p + "!", "Ami", 1);
			scr_text("Selamat telah membantu aku memindahkan tumpukan kontainernya!", "Ami", 1);
			scr_text("Aku berterima kasih banget kepadamu!", "Ami", 1);
			scr_text("Ini sangat berarti bagiku, terima kasih lagi ya, " + _p + "!", "Ami", 1);
			scr_text("Karena kamu sudah menyelesaikan masalah ini, kamu bisa lanjut urusan lain atau istirahat dulu!", "Ami", 1);
			scr_text("Itu pilihanmu, " + _p + "!", "Ami", 1);
			scr_text("Ok " + _p + ", sampai jumpa kembali!", "Ami", 1)
			break;
	
	
	// == STATIC NPC ==
		// Andrun
		case "Andrun_default":
			scr_text("Saya sering ke tempat ini karena bisa melihat luar angkasa sambil bekerja di cafe!", "Andrun", 1);
			scr_text("Lihatlah, betapa megahnya luar angkasa!", "Andrun", 1);
			scr_text("Sebagai salesman, saya kurang tahu bagaimana angkasa ini bisa tercipta sebagus ini!", "Andrun", 1);
			break;	
		
		// Aisyah & Ali
		case "Aisyah_default":
			scr_text("Alhamdulillah, makanan dan minuman di cafe ini sangat enak!", "Aisyah", 1);
			scr_text("Iya, saya setuju...", "Ali", 1);
			scr_text("Rasa kopi dan martabaknya enak sekali!", "Ali", 1);
			scr_text("Iya, dan kroisannya sangat renyah", "Aisyah", 1);
			scr_text("Kapan-kapan kita ke sini lagi, Ali!", "Aisyah", 1);
			scr_text("Iya, saat kita kembali berkunjung ke lounge ini!", "Aisyah", 1);
			break;
			
		case "Ali_default":
			scr_text("Saya tidak pernah berpikir bahwa ternyata ada lounge di luar angkasa", "Ali", 1);
			scr_text("Iya, setahu saya, lounge ini adalah inisiatif dari rektor Binus untuk memperluas jangkauan kampusnya!", "Aisyah", 1);
			scr_text("Ternyata, beliau tidak hanya memikirkan ekspansi di bumi saja, tapi juga sampai ke luar angkasa!", "Ali", 1);
			scr_text("Iya, kita beruntung sekali bisa berada di lounge ini!", "Aisyah", 1);
			scr_text("Iya, dan kita harus bersyukur bisa melihat ciptaan Tuhan secara langsung!", "Aisyah", 1);
			break;
		
		// Rise (Info)
		case "Rise_default":
			scr_text("Halo " + _p + "!", "Rise", 1);
			scr_text("Apakah ada yang bisa saya bantu?", "Rise", 1);
			scr_text("?", _p, -1);
			scr_option("Apa permasalahan yang sekarang dihadapi?", "rise_1");
			scr_option("Beri tahu saya sejarah tempat ini!", "rise_2");
			scr_option("Tidak ada, terima kasih!", "rise_3");
			break;
				
				case "rise_1":
					scr_text("Jadi, ada empat permasalahan utama yang sedang kita hadapi!", "Rise", 1);
					scr_text("Pertama, jukebox di cafe mengalami kerusakan dan perlu diperbaiki!", "Rise", 1);
					scr_text("Kedua, data arsip di ruang Archive perlu ditinjau dan dirapikan di dekat office!", "Rise", 1);
					scr_text("Ketiga, Ami, pengurus logistik lounge, membutuhkan bantuan memindahkan kontainer di storage room atas cafe!", "Rise", 1);
					scr_text("Dan terakhir, menu cafe belum tersortir dengan baik!", "Rise", 1);
					scr_text("Baiklah " + _p + ", semoga Anda bisa membantu menyelesaikan permasalahan tersebut!", "Rise", 1);
					scr_text("Jika membutuhkan bantuan lain, Anda bisa bicara ke saya!", "Rise", 1);
					break;
					
				case "rise_2":
					scr_text("Baiklah, saya akan jelaskan sejarah tempat ini!", "Rise", 1);
					scr_text("Tempat ini merupakan hasil dari sebuah ide atau visi rektor Binus dahulu kala!", "Rise", 1);
					scr_text("Awalnya, Binus hanya merupakan universitas di Jakarta, Indonesia!", "Rise", 1);
					scr_text("Namun, seiring waktu...", "Rise", 1);
					scr_text("Binus berkembang melakukan ekspansi ke kota-kota lain, hingga sampai ke luar negeri!", "Rise", 1);
					scr_text("Meskipun sudah pesat, hal ini bukan tujuan akhir dari Binus!", "Rise", 1);
					scr_text("Saat itu, rektor Binus mempunyai ide mengembangkan universitas ke luar angkasa!", "Rise", 1);
					scr_text("Awalnya orang-orang tidak percaya hal itu akan terjadi...", "Rise", 1);
					scr_text("Tetapi beliau tetap percaya dengan ide tersebut!", "Rise", 1);
					scr_text("Dengan kerja keras, beliau mampu membuat prototipe lounge pertama...", "Rise", 1);
					scr_text("Namun, prototipe itu gagal evaluasi dan beliau harus bekerja keras lagi!", "Rise", 1);
					scr_text("Prototipenya dikembangkan terus dan beliau belajar dari kesalahan!", "Rise", 1);
					scr_text("Akhirnya, beliau sukses mengembangkan prototipe yang berhasil setelah beberapa kegagalan!", "Rise", 1);
					scr_text("Prototipe tersebut dikembangkan turun-temurun hingga lounge ini bisa diluncurkan ke luar angkasa!", "Rise", 1);
					scr_text("Meskipun beliau tidak lagi bisa melihat lounge ini...", "Rise", 1);
					scr_text("Tetapi saya yakin beliau akan sangat bangga dengan ciptaannya!", "Rise", 1);
					scr_text("Dan itulah sejarah dari lounge ini hingga sekarang!", "Rise", 1);
							
				case "rise_3":
					scr_text("Baiklah " + _p + "!", "Rise", 1);
					scr_text("Jika membutuhkan bantuan lain, silakan bicara ke saya lagi!", "Rise", 1);
					break;
		
		// Staf Cafe
		case "stafCafe_default":
			scr_text("Halo " + _p + "!", "sCafe", 1);
			scr_text("Apa yang ingin Anda pesan?", "sCafe", 1);
			scr_text("?", _p, -1);
			scr_option("Iya, saya ingin pesan makanan!", "cafe_1");
			scr_option("Iya, saya ingin pesan minuman!", "cafe_2");
			scr_option("Maaf, saya tidak jadi pesan!", "cafe_3");
			break;
				
				case "cafe_1":
					scr_text("Baik, makanan apa yang ingin Anda pesan?", "sCafe", 1);
					scr_text("?", _p, -1);
					scr_option("Kroisan coklat", "cafe_1a");
					scr_option("Telur orak-arik", "cafe_1b");
					scr_option("Martabak", "cafe_1c");
					break;
					
						case "cafe_1a":
						scr_text("Hmm, makanan pilihan orang Prancis, 'pain au chocolat'!", "sCafe", 1);
						scr_text("Baik " + _p + ", ini kroisan coklatnya!", "sCafe", 1);
						scr_text("~ Saya mendapatkan kroisan coklat! ~");
						scr_gameText("order_cont");
						break;
					
						case "cafe_1b":
						scr_text("Hmm, salah satu dari beberapa jenis hidangan telur yang ada!", "sCafe", 1);
						scr_text("Baik " + _p + ", ini telur orak-ariknya!", "sCafe", 1);
						scr_text("~ Saya mendapatkan telur orak-arik! ~");
						scr_gameText("order_cont");
						break;
					
						case "cafe_1c":
						scr_text("Hmm, makanan yang disukai banyak orang Asia!", "sCafe", 1);
						scr_text("Baik " + _p + ", ini martabaknya", "sCafe", 1);
						scr_text("~ Saya mendapatkan martabak! ~");
						scr_gameText("order_cont");
						break;
					
				case "cafe_2":
					scr_text("Baik, minuman apa yang ingin Anda pesan?", "sCafe", 1);
					scr_text("?", _p, -1);
					scr_option("Cappucino", "cafe_2a");
					scr_option("Teh hijau", "cafe_2b");
					scr_option("Susu kocok", "cafe_2c");
					break;
					
						case "cafe_2a":
						scr_text("Hmm, kopi dengan aroma yang kuat dan harum sekali!", "sCafe", 1);
						scr_text("Baik " + _p + ", ini cappucinonya!", "sCafe", 1);
						scr_text("~ Saya mendapatkan cappucino! ~");
						scr_gameText("order_cont");
						break;
					
						case "cafe_2b":
						scr_text("Hmm, pilihan yang bijak untuk kesehatan Anda!", "sCafe", 1);
						scr_text("Baik " + _p + ", ini teh hijaunya!", "sCafe", 1);
						scr_text("~ Saya mendapatkan teh hijau! ~");
						scr_gameText("order_cont");
						break;
					
						case "cafe_2c":
						scr_text("Hmm, minuman yang menggabungkan susu, es krim, dan sirop menjadi satu!", "sCafe", 1);
						scr_text("Baik " + _p + ", ini susu kocoknya", "sCafe", 1);
						scr_text("~ Saya mendapatkan susu kocok! ~");
						scr_gameText("order_cont");
						break;
					
				case "cafe_3":
					scr_text("Baik " + _p + "!", "sCafe", 1);
					scr_text("Anda bisa kembali lagi kapan saja untuk memesan!", "sCafe", 1);
					break;
					
				case "cafe_4":
					scr_text("Baik " + _p + "!", "sCafe", 1);
					scr_text("Selamat menikmati!", "sCafe", 1);
					break;
		
			case "order_cont":
				scr_text("Baik " + _p + ", apakah Anda mau tambah pesanan?", "sCafe", 1);
				scr_text("?", _p, -1);
				scr_option("Iya, saya ingin pesan makanan!", "cafe_1");
				scr_option("Iya, saya ingin pesan minuman!", "cafe_2");
				scr_option("Tidak ada lagi, terima kasih!", "cafe_4");
				break;
			
		// Reynomn
		case "Reynomn_default":
			scr_text("Huh, saya masih ada kerjaan laporan yang belum selesai!", "Reynomn", 1);
			scr_text("Saya harus mencetak laporan ini untuk Supervisor saya!", "Reynomn", 1);
			scr_text("Kalau boleh jujur, saya sedikit malas mengerjakannya...", "Reynomn", 1);
			scr_text("Tetapi, bagaimana lagi?", "Reynomn", 1);
			scr_text("Saya tidak ada pilihan selain menyelesaikan tugas yang diberikan!", "Reynomn", 1)
			break;
		
		// Archive / Office Dialogue
		case "Supervisor_default":
			scr_text(_p + ", untuk memulai tugas pengecekan...", "Supervisor", 1);
			scr_text("Silakan akses terminal Archive di depan Anda untuk memeriksa dokumen data!", "Supervisor", 1);
			scr_text("Semoga Anda sukses dalam tugas Anda!", "Supervisor", 1);
			break;
			
		case "Gregory_default":
			scr_text("Halo " + _p + "!", "Gregory", 1);
			scr_text("Silakan buka terminal di sebelah saya untuk mengakses ruang Archive.", "Gregory", 1);
			scr_text("Semoga Anda berhasil merapikan datanya dengan baik!", "Gregory", 1);
			scr_text("Ingatlah untuk selalu disiplin dan teliti saat memeriksa dokumen!", "Gregory", 1);
			break;
			
		// Arcade
		case "Yuna_default":
			scr_text("Halo, kamu pasti " + _p + " bukan?", "Yuna", 1);
			scr_text("Baik, salam kenal " + _p + "!", "Yuna", 1);
			scr_text("Saya Yuna, bersama kakak saya, kami adalah pemilik arcade!", "Yuna", 1);
			scr_text("Arcadenya berada di dekat cafe, di ruangan paling bawah!", "Yuna", 1);
			scr_text("Di sana, kamu bisa memainkan game-game seru yang saya jamin bikin betah!", "Yuna", 1);
			scr_text("Ok, kalau kamu sudah siap, silakan masuk ke ruang Arcade!", "Yuna", 1);
			scr_text("Dan satu hal lagi, berikan salam ke kakak saya, Yuri, serta Bernard si teknisi arcade!", "Yuna", 1);
			break;
			
		case "Yuri_default":
			scr_text("Halo " + _p + "!", "Yuri", 1);
			scr_text("Yuna sudah memberitahumu tentang tempat ini ya?", "Yuri", 1);
			scr_text("Ok, selamat datang di arcade!", "Yuri", 1);
			scr_text("Arcade ini merupakan tempat bagi orang untuk memainkan game-game seru!", "Yuri", 1);
			scr_text("Nah, berdasarkan permasalahan yang sudah kamu selesaikan...", "Yuri", 1);
			scr_text("Saya dan Bernard berpikir untuk membuat versi game dari permasalahan tersebut!", "Yuri", 1);
			scr_text("Kami berharap dengan game ini, kamu bisa mengasah kemampuan lebih jauh...", "Yuri", 1);
			scr_text("Sehingga kamu mampu menyelesaikan tugas dengan lebih cepat dan efisien!", "Yuri", 1);
			scr_text("Ok " + _p + ", selamat bermain dan semoga suka gamenya!", "Yuri", 1);
			break;
			
		case "Bernard_default":
			scr_text("Halo!", "Bernard", 1);
			scr_text("Saya Bernard, teknisi arcade di sini!", "Bernard", 1);
			scr_text("Yuri dan Yuna memanggil saya karena saya lulusan teknik elektro dan hobi main game!", "Bernard", 1);
			scr_text("Kebetulan atau bukan? Entahlah!", "Bernard", 1);
			scr_text("Jadi, selamat bermain game-game yang kami buat untukmu, " + _p + "!", "Bernard", 1);
			break;
			
	}
}